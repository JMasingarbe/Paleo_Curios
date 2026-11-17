-- =============================================================================
--  Origine de ce fichier
-- =============================================================================
--  Ce jeu de données de test a été généré avec Claude (assistant IA d'Anthropic),
--  à la demande de Juliette Masingarbe, puis adapté au schéma db_paleocurios.sql.
--
--  Méthode :
--    - les 12 premiers fossiles, les comptes, les rôles et les articles ont été
--      écrits un par un, chacun pour couvrir un cas précis du modèle ;
--    - les fossiles 13 à 100 ont été produits par un script Python, à partir d'un
--      catalogue d'espèces réelles où chaque espèce a sa collection, sa période,
--      sa fourchette de datation, ses gisements et son continent ; le tirage
--      aléatoire utilise une graine fixe, donc le résultat est reproductible ;
--    - le script applique des règles de cohérence : datation comprise dans la
--      période, continent identique à celui du pays du gisement, fossiles de
--      gisements protégés attribués uniquement à des musées ou des universités ;
--    - les mots de passe sont des empreintes générées avec password_hash() de PHP.
--
--  Vérification : le fichier a été chargé sur MariaDB 10.11, puis contrôlé par
--  des requêtes SQL (contraintes, dates, cohérence entre tables, positions).
--
--  Les personnes, e-mails, propriétaires, musées, fossiles et articles sont
--  fictifs. Les espèces, gisements et périodes géologiques sont réels, mais les
--  valeurs (âges, tailles, coordonnées) sont approximatives : ces données servent
--  uniquement aux tests et ne doivent pas être utilisées comme référence
--  scientifique.
-- =============================================================================

-- =============================================================================
--  Paléo Curios — Jeu de données de test
-- =============================================================================
--  À exécuter APRÈS db_paleocurios.sql, sur une base vide (base paleocurios).
--
--  Contenu : 100 fossiles, 56 espèces, 28 lieux, 10 propriétaires, 143 images,
--  45 favoris, 5 comptes utilisateurs et 3 articles.
--
--  Aucun propriétaire (owner) ni aucun auteur (author) n'est rattaché à un compte
--  utilisateur : owner.id_user et author.id_user sont tous à NULL.
--
--  Ce qui est fictif :
--    - toutes les personnes, tous les e-mails et comptes utilisateurs ;
--    - les propriétaires, les musées (sauf les sites de Messel et de La Brea),
--      les fossiles eux-mêmes, les articles et leurs auteurs ;
--    - les adresses postales des musées.
--  Ce qui est réel, pour rendre les tests crédibles :
--    - les continents, pays, gisements et espèces ;
--    - pour chaque espèce : sa collection, sa période, son âge approximatif,
--      son gisement et son continent sont cohérents entre eux ;
--    - les bornes des périodes géologiques (charte chronostratigraphique
--      internationale de l'ICS, à revérifier avant une mise en production).
--  Les coordonnées GPS des gisements sont approximatives.
--
--  Les fossiles issus de gisements protégés ou dont l'exportation est interdite
--  (Messel, La Brea, Liaoning, Mongolie, Karoo…) appartiennent uniquement à des
--  musées ou à des universités, comme ce serait le cas dans la réalité.
--
--  Les e-mails utilisent les domaines example.org / example.net / .example,
--  réservés à la documentation : aucun message ne peut partir par erreur.
--
--  Mot de passe de TOUS les comptes : MotDePasse123!
--  (empreintes générées avec password_hash() de PHP, vérifiables avec password_verify())
--
--  Les identifiants sont écrits explicitement pour que les clés étrangères
--  soient lisibles. Cela suppose une base qui vient d'être créée.
-- =============================================================================

USE paleocurios;
SET NAMES utf8mb4;

-- Tout le jeu de données est inséré d'un bloc : si une ligne échoue,
-- la connexion se ferme sans COMMIT et rien n'est enregistré.
START TRANSACTION;


-- =============================================================================
--  1. LIEUX
-- =============================================================================

INSERT INTO continent (id_continent, continent_name) VALUES
    (1, 'Afrique'),
    (2, 'Amérique du Nord'),
    (3, 'Amérique du Sud'),
    (4, 'Antarctique'),
    (5, 'Asie'),
    (6, 'Europe'),
    (7, 'Océanie');

INSERT INTO country (id_country, country_name, id_continent) VALUES
    (1, 'France', 6),
    (2, 'Allemagne', 6),
    (3, 'Royaume-Uni', 6),
    (4, 'États-Unis', 2),
    (5, 'Chine', 5),
    (6, 'Maroc', 1),
    (7, 'Australie', 7),
    (8, 'Argentine', 3),   -- pays sans fossile : teste un filtre qui ne renvoie rien
    (9, 'Mongolie', 5),
    (10, 'Pays-Bas', 6),
    (11, 'Belgique', 6),
    (12, 'Afrique du Sud', 1);

-- Lieux 1 à 8 et 12 à 26 : gisements réels (extraction).
-- Lieux 5 et 7 : à la fois gisement ET lieu d'exposition.
-- Lieux 9 à 11, 27 et 28 : lieux d'exposition fictifs, avec une adresse postale.
-- Lieux 3, 12 et 16 : gisements sensibles (localisation masquée au public).
INSERT INTO place (id_place, place_name, place_link, place_address, place_postcode,
                   place_city, place_region, place_latitude, place_longitude,
                   place_is_sensitive, id_country) VALUES
    -- Gisement classique : ville, région et coordonnées, pas d'adresse
    (1, 'Carrières de Solnhofen', NULL, NULL, NULL,
        'Solnhofen', 'Bavière', 48.896000, 10.987000, 0, 2),
    -- Formation géologique très étendue : ni ville ni coordonnées
    (2, 'Formation de Hell Creek', NULL, NULL, NULL,
        NULL, 'Montana', NULL, NULL, 0, 4),
    -- Gisement sensible (pillage) : coordonnées en base mais masquées sur le site
    (3, 'Formation de Yixian', NULL, NULL, NULL,
        NULL, 'Liaoning', 41.600000, 120.800000, 1, 5),
    (4, 'Falaises de Lyme Regis', NULL, NULL, NULL,
        'Lyme Regis', 'Dorset', 50.725000, -2.936000, 0, 3),
    -- Gisement qui sert aussi de lieu d'exposition (centre des visiteurs)
    (5, 'Fosse de Messel', NULL, NULL, NULL,
        'Messel', 'Hesse', 49.917000, 8.756000, 0, 2),
    (6, 'Lits du Kem Kem', NULL, NULL, NULL,
        NULL, 'Drâa-Tafilalet', NULL, NULL, 0, 6),
    -- Autre gisement qui est aussi un musée
    (7, 'La Brea Tar Pits', NULL, NULL, NULL,
        'Los Angeles', 'Californie', 34.063000, -118.356000, 0, 4),
    (8, 'Mines de Commentry', NULL, NULL, NULL,
        'Commentry', 'Auvergne-Rhône-Alpes', 46.288000, 2.741000, 0, 1),
    -- Lieux d'exposition fictifs : adresse postale, pas de coordonnées
    (9, 'Muséum de Belcastel', 'https://museum-belcastel.example', '12 rue des Ammonites', '31000',
        'Toulouse', 'Occitanie', NULL, NULL, 0, 1),
    (10, 'Galerie de paléontologie de l''Université de la Garonne', 'https://univ-garonne.example/galerie', '2 allée des Trilobites', '31400',
        'Toulouse', 'Occitanie', NULL, NULL, 0, 1),
    (11, 'Fossilia — salle d''exposition', 'https://fossilia.example', '8 place du Gisement', '81000',
        'Albi', 'Occitanie', NULL, NULL, 0, 1),
    -- Nouveaux gisements réels
    (12, 'Formation de Jiufotang', NULL, NULL, NULL,
        NULL, 'Liaoning', NULL, NULL, 1, 5),
    (13, 'Carrières de Kemmerer (Formation de Green River)', NULL, NULL, NULL,
        'Kemmerer', 'Wyoming', 41.792000, -110.537000, 0, 4),
    -- Formation qui s'étend sur plusieurs États : pas de région
    (14, 'Formation de Morrison', NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 0, 4),
    (15, 'Schistes de Wheeler', NULL, NULL, NULL,
        NULL, 'Utah', NULL, NULL, 0, 4),
    (16, 'Falaises flamboyantes de Bayanzag', NULL, NULL, NULL,
        NULL, 'Ömnögovi', 44.138000, 103.728000, 1, 9),
    (17, 'Carrières de Maastricht', NULL, NULL, NULL,
        'Maastricht', 'Limbourg', 50.851000, 5.691000, 0, 10),
    (18, 'Côte de Whitby', NULL, NULL, NULL,
        'Whitby', 'Yorkshire du Nord', 54.486000, -0.615000, 0, 3),
    (19, 'Carrières de Holzmaden', NULL, NULL, NULL,
        'Holzmaden', 'Bade-Wurtemberg', 48.633000, 9.525000, 0, 2),
    (20, 'Charbonnage de Bernissart', NULL, NULL, NULL,
        'Bernissart', 'Hainaut', 50.475000, 3.645000, 0, 11),
    (21, 'Gisement de Trossingen', NULL, NULL, NULL,
        'Trossingen', 'Bade-Wurtemberg', 48.075000, 8.635000, 0, 2),
    (22, 'Bassin des Ouled Abdoun', NULL, NULL, NULL,
        'Khouribga', 'Béni Mellal-Khénifra', NULL, NULL, 0, 6),
    (23, 'Gisements d''Alnif', NULL, NULL, NULL,
        'Alnif', 'Drâa-Tafilalet', NULL, NULL, 0, 6),
    (24, 'Mazon Creek', NULL, NULL, NULL,
        NULL, 'Illinois', NULL, NULL, 0, 4),
    (25, 'Bassin du Karoo', NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 0, 12),
    (26, 'Wren''s Nest', NULL, NULL, NULL,
        'Dudley', 'Midlands de l''Ouest', 52.522000, -2.098000, 0, 3),
    -- Nouveaux lieux d'exposition fictifs
    (27, 'Musée de la Pierre Ancienne', 'https://pierre-ancienne.example', '5 rue des Fougères', '33000',
        'Bordeaux', 'Nouvelle-Aquitaine', NULL, NULL, 0, 1),
    (28, 'Galerie de l''Institut de paléontologie du Rhône', 'https://institut-paleo-rhone.example', '17 quai des Fossiles', '69007',
        'Lyon', 'Auvergne-Rhône-Alpes', NULL, NULL, 0, 1);
-- Remarque : en SQL, une apostrophe dans une chaîne se double ('l''Université').


-- =============================================================================
--  2. RÉFÉRENTIELS DES FOSSILES
-- =============================================================================

INSERT INTO collection (id_collection, collection_name) VALUES
    (1, 'Vertébrés'),
    (2, 'Invertébrés'),
    (3, 'Insectes'),
    (4, 'Plantes'),
    (5, 'Autres');

INSERT INTO fossil_type (id_fossil_type, fossil_type_name) VALUES
    (1, 'Squelette complet'),
    (2, 'Squelette partiel'),
    (3, 'Crâne'),
    (4, 'Dent'),
    (5, 'Vertèbre'),
    (6, 'Coquille'),
    (7, 'Coprolithe'),
    (8, 'Empreinte de pas'),
    (9, 'Empreinte de tissus mous'),
    (10, 'Feuille'),
    (11, 'Œuf'),
    (12, 'Carapace'),
    (13, 'Inclusion dans l''ambre'),
    (14, 'Bois pétrifié'),
    (15, 'Griffe'),
    (16, 'Os isolé');

INSERT INTO species (id_species, species_name, species_link) VALUES
    (1, 'Archaeopteryx lithographica', 'https://fr.wikipedia.org/wiki/Archaeopteryx'),
    (2, 'Tyrannosaurus rex', 'https://fr.wikipedia.org/wiki/Tyrannosaurus'),
    (3, 'Microraptor gui', 'https://fr.wikipedia.org/wiki/Microraptor'),
    (4, 'Promicroceras planicosta', NULL),
    (5, 'Calymene blumenbachii', 'https://fr.wikipedia.org/wiki/Calymene'),
    (6, 'Smilodon fatalis', 'https://fr.wikipedia.org/wiki/Smilodon'),
    (7, 'Meganeura monyi', 'https://fr.wikipedia.org/wiki/Meganeura'),
    (8, 'Glossopteris browniana', NULL),
    (9, 'Spinosaurus aegyptiacus', 'https://fr.wikipedia.org/wiki/Spinosaurus'),
    (10, 'Messelornis cristata', NULL),
    (11, 'Triceratops horridus', 'https://fr.wikipedia.org/wiki/Triceratops'),
    (12, 'Edmontosaurus annectens', 'https://fr.wikipedia.org/wiki/Edmontosaurus'),
    (13, 'Allosaurus fragilis', 'https://fr.wikipedia.org/wiki/Allosaurus'),
    (14, 'Stegosaurus stenops', 'https://fr.wikipedia.org/wiki/Stegosaurus'),
    (15, 'Velociraptor mongoliensis', 'https://fr.wikipedia.org/wiki/Velociraptor'),
    (16, 'Protoceratops andrewsi', 'https://fr.wikipedia.org/wiki/Protoceratops'),
    (17, 'Psittacosaurus lujiatunensis', 'https://fr.wikipedia.org/wiki/Psittacosaurus'),
    (18, 'Confuciusornis sanctus', 'https://fr.wikipedia.org/wiki/Confuciusornis'),
    (19, 'Carcharodontosaurus saharicus', 'https://fr.wikipedia.org/wiki/Carcharodontosaurus'),
    (20, 'Mosasaurus hoffmannii', 'https://fr.wikipedia.org/wiki/Mosasaurus'),
    (21, 'Ichthyosaurus communis', 'https://fr.wikipedia.org/wiki/Ichthyosaurus'),
    (22, 'Plesiosaurus dolichodeirus', 'https://fr.wikipedia.org/wiki/Plesiosaurus'),
    (23, 'Dapedium politum', NULL),
    (24, 'Stenopterygius quadriscissus', NULL),
    (25, 'Iguanodon bernissartensis', 'https://fr.wikipedia.org/wiki/Iguanodon'),
    (26, 'Plateosaurus trossingensis', 'https://fr.wikipedia.org/wiki/Plateosaurus'),
    (27, 'Coelophysis bauri', 'https://fr.wikipedia.org/wiki/Coelophysis'),
    (28, 'Lystrosaurus murrayi', 'https://fr.wikipedia.org/wiki/Lystrosaurus'),
    (29, 'Mesosaurus tenuidens', 'https://fr.wikipedia.org/wiki/Mesosaurus'),
    (30, 'Dimetrodon limbatus', 'https://fr.wikipedia.org/wiki/Dimetrodon'),
    (31, 'Knightia eocaena', NULL),
    (32, 'Diplomystus dentatus', NULL),
    (33, 'Mioplosus labracoides', NULL),
    (34, 'Eurotamandua joresi', NULL),
    (35, 'Aenocyon dirus', NULL),
    (36, 'Mammuthus columbi', NULL),
    (37, 'Mammuthus primigenius', 'https://fr.wikipedia.org/wiki/Mammouth_laineux'),
    (38, 'Coelodonta antiquitatis', NULL),
    (39, 'Ursus spelaeus', 'https://fr.wikipedia.org/wiki/Ours_des_cavernes'),
    (40, 'Otodus megalodon', NULL),
    (41, 'Otodus obliquus', NULL),
    (42, 'Asteroceras obtusum', NULL),
    (43, 'Dactylioceras commune', NULL),
    (44, 'Hildoceras bifrons', NULL),
    (45, 'Seirocrinus subangularis', NULL),
    (46, 'Elrathia kingii', NULL),
    (47, 'Drotops megalomanicus', NULL),
    (48, 'Eldredgeops rana', NULL),
    (49, 'Eurypterus remipes', 'https://fr.wikipedia.org/wiki/Eurypterus'),
    (50, 'Micraster coranguinum', NULL),
    (51, 'Lepidodendron aculeatum', 'https://fr.wikipedia.org/wiki/Lepidodendron'),
    (52, 'Calamites suckowii', 'https://fr.wikipedia.org/wiki/Calamites'),
    (53, 'Annularia stellata', NULL),
    (54, 'Araucarioxylon arizonicum', NULL),
    (55, 'Ginkgo adiantoides', NULL),
    (56, 'Tullimonstrum gregarium', NULL);

-- Bornes en millions d'années : début (le plus ancien) puis fin.
INSERT INTO geological_period (id_period, period_name, period_start, period_end) VALUES
    (1,  'Cambrien',     538.800, 485.400),
    (2,  'Ordovicien',   485.400, 443.800),
    (3,  'Silurien',     443.800, 419.200),
    (4,  'Dévonien',     419.200, 358.900),
    (5,  'Carbonifère',  358.900, 298.900),
    (6,  'Permien',      298.900, 251.902),
    (7,  'Trias',        251.902, 201.400),
    (8,  'Jurassique',   201.400, 143.100),
    (9,  'Crétacé',      143.100,  66.000),
    (10, 'Paléogène',     66.000,  23.030),
    (11, 'Néogène',       23.030,   2.580),
    (12, 'Quaternaire',    2.580,   0.000);


-- =============================================================================
--  3. UTILISATEURS ET RÔLES
-- =============================================================================

-- Comptes de test (mot de passe : MotDePasse123!)
INSERT INTO `user` (id_user, user_email, user_pwd, user_created_at) VALUES
    (1, 'admin@paleo-curios.example',
        '$2y$10$koO8Q/xy0IbB/i7a0MNrme9miUK.eUi69i0gs4Ky15FONaQ./epcW', '2026-04-15 09:00:00'),
    (2, 'camille.durand@example.org',   -- paléontologue vérifiée
        '$2y$10$Qkx2KkMjK8dr0vX3p0Ta5.qPcpxidSlmW8lx7F5IB8heZZwu6iSGS', '2026-05-02 11:24:00'),
    (3, 'hugo.martin@example.org',      -- paléontologue vérifié
        '$2y$10$z5Fa4iTBHmdsSwfVyWmp5.bxpfMxIZfvyGInZpe4ZXAwYc14Gb6TO', '2026-05-18 16:40:00'),
    (4, 'lea.petit@example.org',        -- paléontologue en attente de validation
        '$2y$10$DPGelOffQcgU8VeIjk3crea6b1NiYdXz2bSDSVRN4qNcPCBR/poba', '2026-10-21 08:12:00'),
    -- Pas de compte n° 5 : il est laissé libre pour garder les mêmes identifiants
    -- que dans les versions précédentes de ce fichier.
    (6, 'nadia.benali@example.org',     -- paléontologue vérifiée
        '$2y$10$iZL/t6GxdsVuT1NodzP9XuQCG65llZHrner89oQY6gGLPvVXGrDIC', '2026-06-01 10:30:00');

-- Les rôles author et owner existent déjà mais ne sont attribués à personne :
-- ils serviront quand un auteur ou un propriétaire pourra avoir un compte.
INSERT INTO `role` (id_role, role_name) VALUES
    (1, 'admin'),
    (2, 'palaeontologist'),
    (3, 'author'),
    (4, 'owner');

-- Rôles des utilisateurs
INSERT INTO user_role (id_user, id_role) VALUES
    (1, 1),   -- admin
    (2, 2),   -- Camille : paléontologue
    (3, 2),   -- Hugo : paléontologue
    (4, 2),   -- Léa : paléontologue (pas encore vérifiée)
    (6, 2);   -- Nadia : paléontologue

-- Profils paléontologues (l'admin n'en a pas).
INSERT INTO palaeontologist (id_user, palaeontologist_first_name, palaeontologist_last_name,
                             palaeontologist_verified) VALUES
    (2, 'Camille', 'Durand', 1),
    (3, 'Hugo',    'Martin', 1),
    (4, 'Léa',     'Petit',  0),   -- ne peut pas encore contacter les propriétaires
    (6, 'Nadia',   'Benali', 1);


-- =============================================================================
--  4. PROPRIÉTAIRES ET FOSSILES
-- =============================================================================

-- Aucun propriétaire n'est rattaché à un compte (id_user à NULL) :
-- owner_email est donc toujours rempli, c'est le seul moyen de les contacter.
-- Nadia Benali est aussi paléontologue (compte n° 6), mais sa fiche de
-- propriétaire est indépendante de ce compte.
INSERT INTO owner (id_owner, owner_type, owner_first_name, owner_name, owner_email, id_user) VALUES
    (1, 'person', 'Nadia', 'Benali', 'nadia.benali@example.org', NULL),
    (2, 'company', NULL, 'Fossilia', 'contact@fossilia.example', NULL),
    (3, 'museum', NULL, 'Muséum de Belcastel', 'contact@museum-belcastel.example', NULL),
    (4, 'university', NULL, 'Université de la Garonne', 'collections@univ-garonne.example', NULL),
    (5, 'person', 'Bernard', 'Lefèvre', 'bernard.lefevre@example.net', NULL),
    (6, 'museum', NULL, 'Musée de la Pierre Ancienne', 'collections@pierre-ancienne.example', NULL),
    (7, 'person', 'Élodie', 'Garnier', 'elodie.garnier@example.net', NULL),
    (8, 'company', NULL, 'Ambres & Insectes', 'contact@ambres-insectes.example', NULL),
    (9, 'university', NULL, 'Institut de paléontologie du Rhône', 'collections@institut-paleo-rhone.example', NULL),
    (10, 'person', 'Marc', 'Dubois', 'marc.dubois@example.org', NULL);

-- Fossiles 1 à 12 : écrits à la main, ils couvrent chacun un cas précis du modèle
-- (commentés ligne par ligne). Les articles et les images d'origine s'y réfèrent.
--
-- Fossiles 13 à 100 : générés à partir d'un catalogue d'espèces réelles.
-- Sur l'ensemble des 100 fossiles, la répartition permet de tester les filtres
-- et les cas limites :
--   - collections : 53 vertébrés, 19 invertébrés, 12 plantes, 9 insectes, 7 autres ;
--   - datation : 66 intervalles, 16 valeurs uniques (min = max), 18 périodes seules ;
--   - 44 fossiles sans lieu d'extraction connu, dont 8 sans continent ;
--   - quelques fossiles sans espèce (coprolithes, ambre, empreintes) ou sans période ;
--   - nombre de clics très variable, pour la page statistiques.
--
-- Ordre des valeurs sur la dernière ligne de chaque fossile :
--   collection, type, propriétaire,   espèce, continent, période,   extraction, exposition
INSERT INTO fossil (id_fossil, fossil_name, fossil_description,
                    fossil_dating_min, fossil_dating_max, fossil_researchable,
                    fossil_click, fossil_added_at,
                    id_collection, id_fossil_type, id_owner,
                    id_species, id_continent, id_period,
                    id_extraction_place, id_exhibition_place) VALUES
    (1, 'Archéoptéryx de Belcastel',
        'Squelette presque complet conservé dans une dalle de calcaire lithographique. Les empreintes des plumes des ailes et de la queue sont nettement visibles.',
        150.500, 151.500, 1, 342, '2026-05-12 10:15:00',
        1, 2, 3,   1, 6, 8,   1, 9),
    (2, 'Dent de Tyrannosaure',
        'Dent de 9 cm, légèrement courbée, aux bords finement dentelés. Pointe intacte, racine partiellement conservée.',
        66.500, 68.000, 0, 518, '2026-05-20 14:02:00',
        1, 4, 2,   2, 2, 9,   2, 11),
    (3, 'Microraptor du Liaoning',
        'Petit dinosaure à plumes aplati sur une plaque de schiste. Les longues plumes des pattes arrière, caractéristiques de l''espèce, sont conservées.',
        119.000, 122.000, 1, 276, '2026-06-03 09:48:00',
        1, 2, 4,   3, 5, 9,   12, 10),
    (4, 'Ammonite de Lyme Regis',
        'Ammonite de 4 cm entièrement pyritisée, aux reflets dorés. Ornementation des côtes bien lisible.',
        193.000, 195.000, 1, 89, '2026-06-18 17:20:00',
        2, 6, 5,   4, 6, 8,   4, NULL),
    -- Période connue, mais ni datation précise ni lieu
    (5, 'Trilobite Calymene',
        'Trilobite enroulé en boule, posture de défense. Provenance exacte inconnue : acheté lors d''une bourse aux minéraux.',
        NULL, NULL, 1, 64, '2026-07-01 11:05:00',
        2, 12, 1,   5, 6, 3,   NULL, NULL),
    -- Même lieu pour l'extraction et l'exposition
    (6, 'Crâne de Smilodon',
        'Crâne complet avec ses deux canines supérieures, longues de près de 20 cm. Coloration sombre due à l''asphalte.',
        0.010, 0.040, 1, 431, '2026-07-09 15:30:00',
        1, 3, 3,   6, 2, 12,   7, 7),
    (7, 'Libellule géante de Commentry',
        'Empreinte d''aile d''un insecte géant dont l''envergure dépassait 60 cm. Le réseau des nervures est parfaitement visible.',
        300.000, 304.000, 1, 152, '2026-07-22 10:00:00',
        3, 9, 4,   7, 6, 5,   8, 10),
    (8, 'Feuille de Glossopteris',
        'Feuille en forme de langue dans un grès fin. Nervure centrale marquée.',
        NULL, NULL, 0, 23, '2026-08-14 13:45:00',
        4, 10, 5,   8, 7, 6,   NULL, NULL),
    -- Espèce inconnue
    (9, 'Coprolithe du Kem Kem',
        'Excrément fossilisé de 12 cm, attribué à un grand prédateur. Contient des fragments d''écailles de poisson.',
        95.000, 100.000, 0, 47, '2026-09-03 09:12:00',
        5, 7, 2,   NULL, 1, 9,   6, 11),
    (10, 'Dent de Spinosaure',
        'Dent conique et striée, adaptée à la capture de poissons. Émail brillant en très bon état.',
        95.000, 100.000, 1, 389, '2026-09-17 16:28:00',
        1, 4, 5,   9, 1, 9,   6, NULL),
    -- Fiche minimale : aucune clé étrangère facultative renseignée
    (11, 'Empreinte tridactyle',
        'Empreinte de pas à trois doigts de 25 cm, origine non documentée.',
        NULL, NULL, 1, 12, '2026-10-05 10:40:00',
        1, 8, 1,   NULL, NULL, NULL,   NULL, NULL),
    -- Datation par valeur unique (min = max) et même lieu d'extraction et d'exposition
    (12, 'Oiseau de Messel',
        'Squelette complet d''un petit oiseau terrestre conservé dans des schistes bitumineux, avec des traces de plumes.',
        47.000, 47.000, 1, 198, '2026-10-12 14:55:00',
        1, 1, 3,   10, 6, 10,   5, 5),
    -- ---- Fossiles 13 à 100 ----
    (13, 'Mésosaure',
        'Mésosaure de 82 cm, squelette complet sur une dalle de schiste. Légère érosion de surface. Acquis auprès d''une ancienne collection privée.',
        NULL, NULL, 1, 58, '2026-04-23 01:51:00',
        1, 1, 9,   29, 3, 6,   NULL, 28),
    (14, 'Dent de Spinosaure',
        'Dent de Spinosaure de 8 cm, émail brillant, sans fissure. Très bon état de conservation.',
        95.000, 100.000, 1, 72, '2026-04-24 07:23:00',
        1, 4, 6,   9, 1, 9,   6, 27),
    (15, 'Trilobite Eldredgeops',
        'Trilobite Eldredgeops de 4 cm, enroulé, yeux bien visibles. Très bon état de conservation. Acquis auprès d''une ancienne collection privée.',
        387.500, 387.500, 1, 57, '2026-04-25 07:13:00',
        2, 12, 9,   48, 2, 4,   NULL, NULL),
    (16, 'Dent de Mégalodon',
        'Dent de Mégalodon de 17 cm, couronne intacte, racine légèrement érodée. Quelques fissures stabilisées lors d''une restauration ancienne. Provenance exacte non documentée.',
        3.600, 20.000, 0, 36, '2026-04-25 08:11:00',
        1, 4, 1,   40, 2, 11,   NULL, NULL),
    (17, 'Vertèbre d''Edmontosaure de Hell Creek',
        'Vertèbre d''Edmontosaure de 9 cm, dorsale, centrum intact. Pièce nettoyée et préparée en laboratoire.',
        67.000, 67.000, 1, 22, '2026-04-26 23:09:00',
        1, 5, 9,   12, 2, 9,   2, 28),
    (18, 'Coléoptère dans l''ambre de la Baltique',
        'Coléoptère dans l''ambre de la Baltique, élytres intacts, ambre très limpide. Quelques fissures stabilisées lors d''une restauration ancienne. Acquis auprès d''une ancienne collection privée.',
        34.000, 48.000, 1, 1, '2026-04-29 02:49:00',
        3, 13, 8,   NULL, NULL, 10,   NULL, NULL),
    (19, 'Trilobite Elrathia de l''Utah',
        'Trilobite Elrathia de 4 cm, spécimen complet, bien contrasté. Pièce nettoyée et préparée en laboratoire.',
        505.000, 507.000, 0, 102, '2026-04-29 16:34:00',
        2, 12, 1,   46, 2, NULL,   15, NULL),
    (20, 'Dent de requin Otodus',
        'Dent de requin Otodus de 4 cm, bords lisses, deux petites cuspides latérales. Pièce conservée sur sa gangue d''origine.',
        50.000, 58.000, 0, 31, '2026-04-30 07:25:00',
        1, 4, 6,   41, 1, 10,   NULL, NULL),
    (21, 'Feuillage d''Annularia',
        'Feuillage d''Annularia de 7 cm, verticilles de feuilles en étoile. Restauration mineure documentée. Provenance exacte non documentée.',
        308.000, 308.000, 1, 59, '2026-05-03 19:55:00',
        4, 10, 6,   53, 2, 5,   NULL, 27),
    (22, 'Bois pétrifié d''Araucarioxylon',
        'Bois pétrifié d''Araucarioxylon de 15 cm, tranche polie aux couleurs vives. Très bon état de conservation. Provenance exacte non documentée.',
        210.000, 220.000, 1, 48, '2026-05-04 14:13:00',
        4, 14, 9,   54, 2, 7,   NULL, NULL),
    (23, 'Oiseau de Messel',
        'Oiseau de Messel de 17 cm, squelette complet avec des traces de plumes. Restauration mineure documentée.',
        47.500, 47.500, 1, 85, '2026-05-06 17:29:00',
        1, 1, 6,   10, 6, 10,   5, 5),
    (24, 'Poisson Diplomystus',
        'Poisson Diplomystus de 25 cm, bouche tournée vers le haut, squelette complet. Restauration mineure documentée.',
        51.500, 52.000, 1, 21, '2026-05-10 22:37:00',
        1, 1, 3,   32, 2, 10,   NULL, 9),
    (25, 'Dent d''Allosaure',
        'Dent d''Allosaure de 4 cm, aux carènes bien nettes. Quelques fissures stabilisées lors d''une restauration ancienne.',
        152.500, 152.500, 1, 386, '2026-05-13 21:38:00',
        1, 4, 6,   13, 2, 8,   14, NULL),
    (26, 'Écorce de Lepidodendron',
        'Écorce de Lepidodendron de 32 cm, motif en écailles caractéristique. Pièce nettoyée et préparée en laboratoire. Provenance exacte non documentée.',
        315.000, 315.000, 1, 67, '2026-05-16 14:45:00',
        4, 9, 7,   51, 6, 5,   NULL, NULL),
    (27, 'Trilobite Elrathia de l''Utah',
        'Trilobite Elrathia de 3 cm, carapace noire sur un schiste gris. Pièce nettoyée et préparée en laboratoire.',
        505.000, 507.000, 0, 198, '2026-05-19 04:13:00',
        2, 12, 10,   46, 2, 1,   15, NULL),
    (28, 'Ammonite Promicroceras',
        'Ammonite Promicroceras de 2 cm, pyritisée, reflets dorés. Pièce conservée sur sa gangue d''origine.',
        193.000, 195.000, 1, 207, '2026-05-20 05:10:00',
        2, 6, 2,   4, 6, 8,   4, 11),
    (29, 'Oursin Micraster',
        'Oursin Micraster de 5 cm, test en forme de cœur, silicifié. Très bon état de conservation. Provenance exacte non documentée.',
        84.000, 89.000, 0, 44, '2026-05-21 10:13:00',
        2, 12, 10,   50, 6, 9,   NULL, NULL),
    (30, 'Ichthyosaure Sténoptérygius de Holzmaden',
        'Ichthyosaure Sténoptérygius d''environ 2 m, squelette complet dans un schiste noir. Restauration mineure documentée.',
        180.000, 183.000, 1, 206, '2026-05-23 11:40:00',
        1, 1, 3,   24, 6, 8,   19, NULL),
    (31, 'Coprolithe de dinosaure',
        'Coprolithe de dinosaure de 10 cm, fragments d''os visibles en coupe. Quelques fissures stabilisées lors d''une restauration ancienne. Acquis auprès d''une ancienne collection privée.',
        NULL, NULL, 1, 19, '2026-05-23 23:56:00',
        5, 7, 6,   NULL, 2, 9,   NULL, NULL),
    (32, 'Molaire de mammouth de Colomb de La Brea',
        'Molaire de mammouth de Colomb de 21 cm, lames d''émail parallèles bien visibles. Légère érosion de surface.',
        0.010, 0.040, 1, 199, '2026-05-26 22:36:00',
        1, 4, 6,   36, 2, 12,   7, 7),
    (33, 'Ammonite Dactylioceras de Whitby',
        'Ammonite Dactylioceras de 6 cm, dans un nodule fendu en deux. Pièce conservée sur sa gangue d''origine.',
        NULL, NULL, 0, 7, '2026-05-28 07:04:00',
        2, 6, 2,   43, 6, 8,   18, 11),
    (34, 'Scorpion de mer Eurypterus',
        'Scorpion de mer Eurypterus de 10 cm, carapace complète avec ses pattes nageuses. Légère érosion de surface.',
        421.250, 421.250, 0, 42, '2026-05-28 12:40:00',
        2, 12, 8,   49, 2, 3,   NULL, NULL),
    (35, 'Trilobite Calymene de Dudley',
        'Trilobite Calymene de 5 cm, carapace complète, posture étendue. Pièce conservée sur sa gangue d''origine.',
        427.000, 430.000, 1, 18, '2026-05-30 12:37:00',
        2, 12, 4,   5, 6, 3,   26, NULL),
    (36, 'Coléoptère dans l''ambre de la Baltique',
        'Coléoptère dans l''ambre de la Baltique, élytres intacts, ambre très limpide. Pièce nettoyée et préparée en laboratoire. Acquis auprès d''une ancienne collection privée.',
        41.000, 41.000, 0, 64, '2026-06-04 15:22:00',
        3, 13, 8,   NULL, 6, 10,   NULL, NULL),
    (37, 'Vertèbre de Platéosaure de Trossingen',
        'Vertèbre de Platéosaure de 12 cm, dorsale, bien préparée. Restauration mineure documentée.',
        208.000, 214.000, 1, 2, '2026-06-18 07:12:00',
        1, 5, 4,   26, 6, 7,   21, 10),
    (38, 'Coprolithe de reptile marin',
        'Coprolithe de reptile marin de 8 cm, coupé et poli, inclusions d''écailles. Légère érosion de surface.',
        NULL, NULL, 0, 44, '2026-06-18 18:05:00',
        5, 7, 2,   NULL, 6, 8,   4, NULL),
    (39, 'Oiseau de Messel',
        'Oiseau de Messel de 22 cm, squelette complet avec des traces de plumes. Pièce nettoyée et préparée en laboratoire.',
        47.000, 48.000, 1, 155, '2026-06-22 15:28:00',
        1, 1, 6,   10, 6, 10,   5, 5),
    (40, 'Griffe de Vélociraptor de Bayanzag',
        'Griffe de Vélociraptor de 8 cm, griffe en faucille du deuxième orteil. Pièce conservée sur sa gangue d''origine.',
        71.000, 75.000, 1, 85, '2026-06-22 23:28:00',
        1, 15, 6,   15, 5, 9,   16, 27),
    (41, 'Ammonite Asteroceras',
        'Ammonite Asteroceras de 8 cm, côtes fortes, carène bien visible. Très bon état de conservation.',
        193.000, 195.000, 1, 81, '2026-06-24 15:49:00',
        2, 6, 3,   42, 6, 8,   NULL, 9),
    (42, 'Monstre de Tully de Mazon Creek',
        'Monstre de Tully de 11 cm, corps allongé et trompe visibles dans un nodule. Restauration mineure documentée.',
        307.000, 309.000, 0, 46, '2026-06-26 17:13:00',
        5, 9, 7,   56, 2, 5,   24, NULL),
    (43, 'Guêpe dans l''ambre de Saint-Domingue',
        'Guêpe dans l''ambre de Saint-Domingue, ailes nervurées bien visibles. Quelques fissures stabilisées lors d''une restauration ancienne. Provenance exacte non documentée.',
        16.000, 20.000, 1, 50, '2026-06-27 22:58:00',
        3, 13, 5,   NULL, 2, 11,   NULL, NULL),
    (44, 'Poisson Dapedium de Lyme Regis',
        'Poisson Dapedium de 28 cm, écailles brillantes en losange parfaitement alignées. Restauration mineure documentée.',
        195.000, 199.000, 1, 119, '2026-07-02 08:18:00',
        1, 1, 9,   23, 6, 8,   4, NULL),
    (45, 'Plaque dorsale de Stégosaure',
        'Plaque dorsale de Stégosaure de 50 cm, réseau vasculaire visible à la surface. Pièce nettoyée et préparée en laboratoire.',
        150.000, 155.000, 1, 21, '2026-07-04 22:29:00',
        1, 16, 10,   14, 2, 8,   NULL, NULL),
    (46, 'Dent de Mosasaure de Maastricht',
        'Dent de Mosasaure de 8 cm, conique, racine encore prise dans la mâchoire. Pièce conservée sur sa gangue d''origine.',
        NULL, NULL, 1, 217, '2026-07-05 03:25:00',
        1, 4, 3,   20, 6, NULL,   17, NULL),
    (47, 'Coléoptère dans l''ambre de la Baltique',
        'Coléoptère dans l''ambre de la Baltique, élytres intacts, ambre très limpide. Pièce polie sur deux faces.',
        34.000, 48.000, 0, 23, '2026-07-06 20:12:00',
        3, 13, 8,   NULL, 6, 10,   NULL, NULL),
    (48, 'Trilobite Elrathia de l''Utah',
        'Trilobite Elrathia de 3 cm, carapace noire sur un schiste gris. Quelques fissures stabilisées lors d''une restauration ancienne.',
        505.000, 507.000, 1, 85, '2026-07-09 08:14:00',
        2, 12, 10,   46, 2, 1,   15, NULL),
    (49, 'Canine d''ours des cavernes',
        'Canine d''ours des cavernes de 9 cm, racine complète. Restauration mineure documentée.',
        0.025, 0.100, 1, 86, '2026-07-10 10:59:00',
        1, 4, 3,   39, 6, 12,   NULL, 9),
    (50, 'Termite dans l''ambre de Saint-Domingue',
        'Termite dans l''ambre de Saint-Domingue, ambre jaune clair poli sur deux faces. Quelques fissures stabilisées lors d''une restauration ancienne. Acquis auprès d''une ancienne collection privée.',
        16.000, 20.000, 1, 78, '2026-07-13 12:45:00',
        3, 13, 8,   NULL, NULL, 11,   NULL, NULL),
    (51, 'Confuciusornis du Liaoning',
        'Confuciusornis de 25 cm, ailes déployées, longues plumes de la queue visibles. Pièce conservée sur sa gangue d''origine.',
        122.500, 122.500, 1, 186, '2026-07-16 17:48:00',
        1, 1, 6,   18, 5, 9,   3, NULL),
    (52, 'Vertèbre de Spinosaure du Kem Kem',
        'Vertèbre de Spinosaure de 18 cm, centrum isolé, bien préparé. Restauration mineure documentée.',
        95.000, 100.000, 1, 213, '2026-07-17 01:38:00',
        1, 5, 3,   9, 1, 9,   6, 9),
    (53, 'Psittacosaure',
        'Psittacosaure de 66 cm, squelette articulé en position de repos. Très bon état de conservation. Provenance exacte non documentée.',
        123.000, 125.000, 1, 125, '2026-07-18 10:14:00',
        1, 1, 9,   17, 5, 9,   NULL, NULL),
    (54, 'Crâne de Protocératops de Bayanzag',
        'Crâne de Protocératops de 44 cm, bec et collerette en bon état. Pièce nettoyée et préparée en laboratoire.',
        NULL, NULL, 1, 55, '2026-07-19 22:26:00',
        1, 3, 9,   16, 5, 9,   16, 28),
    (55, 'Scarabée de Messel',
        'Scarabée de Messel de 3 cm, couleurs métalliques encore visibles sur les élytres. Pièce conservée sur sa gangue d''origine.',
        47.500, 47.500, 1, 5, '2026-07-21 18:26:00',
        3, 9, 6,   NULL, 6, 10,   5, 5),
    (56, 'Feuille de Glossopteris',
        'Feuille de Glossopteris de 13 cm, en forme de langue, nervure centrale marquée. Pièce conservée sur sa gangue d''origine.',
        NULL, NULL, 0, 321, '2026-07-23 06:51:00',
        4, 10, 5,   8, NULL, 6,   NULL, NULL),
    (57, 'Tige de Calamites de Commentry',
        'Tige de Calamites de 35 cm, articulée, aux côtes longitudinales. Pièce conservée sur sa gangue d''origine.',
        NULL, NULL, 1, 2, '2026-07-25 22:50:00',
        4, 9, 3,   52, 6, 5,   8, 9),
    (58, 'Monstre de Tully de Mazon Creek',
        'Monstre de Tully de 8 cm, corps allongé et trompe visibles dans un nodule. Pièce conservée sur sa gangue d''origine.',
        307.000, 309.000, 1, 145, '2026-07-27 22:03:00',
        5, 9, 7,   56, 2, 5,   24, NULL),
    (59, 'Empreinte de pas de reptile',
        'Empreinte de pas de reptile de 15 cm, cinq doigts, empreinte en relief. Légère érosion de surface. Provenance exacte non documentée.',
        NULL, NULL, 1, 207, '2026-07-28 10:34:00',
        1, 8, 3,   NULL, 6, 7,   NULL, 9),
    (60, 'Fémur de Smilodon de La Brea',
        'Fémur de Smilodon de 30 cm, coloration sombre due à l''asphalte. Quelques fissures stabilisées lors d''une restauration ancienne.',
        0.010, 0.040, 1, 3, '2026-07-30 05:34:00',
        1, 16, 4,   6, 2, 12,   7, 10),
    (61, 'Crâne de loup sinistre de La Brea',
        'Crâne de loup sinistre de 30 cm, complet, coloration sombre due à l''asphalte. Pièce nettoyée et préparée en laboratoire.',
        0.025, 0.025, 1, 50, '2026-07-30 07:31:00',
        1, 3, 4,   35, 2, 12,   7, 7),
    (62, 'Trilobite Calymene',
        'Trilobite Calymene de 6 cm, carapace complète, posture étendue. Quelques fissures stabilisées lors d''une restauration ancienne.',
        427.000, 430.000, 1, 33, '2026-08-04 02:47:00',
        2, 12, 9,   5, 6, 3,   26, 28),
    (63, 'Feuille de Glossopteris',
        'Feuille de Glossopteris de 6 cm, en forme de langue, nervure centrale marquée. Restauration mineure documentée.',
        NULL, NULL, 1, 90, '2026-08-04 14:51:00',
        4, 10, 9,   8, 7, 6,   NULL, 28),
    (64, 'Épine dorsale de Dimétrodon',
        'Épine dorsale de Dimétrodon de 44 cm, fragment de la voile dorsale. Quelques fissures stabilisées lors d''une restauration ancienne.',
        280.000, 290.000, 1, 72, '2026-08-09 07:56:00',
        1, 5, 9,   30, 2, 6,   NULL, NULL),
    (65, 'Squelette de Cœlophysis',
        'Squelette de Cœlophysis d''environ 1,8 m, cou et crâne en connexion, posture arquée. Légère érosion de surface. Acquis auprès d''une ancienne collection privée.',
        205.000, 210.000, 1, 132, '2026-08-12 03:05:00',
        1, 2, 2,   27, 2, 7,   NULL, 11),
    (66, 'Dent de Tricératops de Hell Creek',
        'Dent de Tricératops de 2 cm, à double racine, surface usée par la mastication. Très bon état de conservation.',
        NULL, NULL, 1, 1, '2026-08-13 03:28:00',
        1, 4, 8,   11, 2, 9,   2, NULL),
    (67, 'Vertèbre de Tyrannosaure de Hell Creek',
        'Vertèbre de Tyrannosaure de 20 cm, caudale, apophyses partiellement conservées. Légère érosion de surface.',
        66.000, 68.000, 1, 114, '2026-08-14 11:54:00',
        1, 5, 10,   2, 2, 9,   2, NULL),
    (68, 'Crinoïde Seirocrinus de Holzmaden',
        'Crinoïde Seirocrinus d''environ 1,1 m, calice et bras déployés sur une plaque de schiste. Légère érosion de surface.',
        181.500, 181.500, 1, 17, '2026-08-18 10:54:00',
        2, 1, 6,   45, 6, 8,   19, 27),
    (69, 'Dent de Mégalodon',
        'Dent de Mégalodon de 15 cm, couronne intacte, racine légèrement érodée. Légère érosion de surface.',
        3.600, 20.000, 1, 78, '2026-08-19 08:59:00',
        1, 4, 3,   40, 2, NULL,   NULL, 9),
    (70, 'Moucheron dans l''ambre de la Baltique',
        'Moucheron dans l''ambre de la Baltique, ailes déployées, bulles d''air autour du corps. Légère érosion de surface. Provenance exacte non documentée.',
        34.000, 48.000, 0, 99, '2026-08-22 18:35:00',
        3, 13, 8,   NULL, 6, NULL,   NULL, NULL),
    (71, 'Perche Mioplosus',
        'Perche Mioplosus de 18 cm, nageoires dorsales épineuses bien visibles. Restauration mineure documentée.',
        51.500, 52.000, 1, 312, '2026-08-23 19:50:00',
        1, 1, 1,   33, 2, 10,   13, NULL),
    (72, 'Dent de requin Otodus de Khouribga',
        'Dent de requin Otodus de 6 cm, bords lisses, deux petites cuspides latérales. Légère érosion de surface.',
        50.000, 58.000, 0, 326, '2026-08-24 00:18:00',
        1, 4, 1,   41, 1, 10,   22, NULL),
    (73, 'Empreinte de pas de théropode',
        'Empreinte de pas de théropode de 27 cm, trois doigts bien marqués. Légère érosion de surface. Provenance exacte non documentée.',
        NULL, NULL, 0, 336, '2026-08-24 04:58:00',
        1, 8, 1,   NULL, 6, 8,   NULL, NULL),
    (74, 'Écorce de Lepidodendron',
        'Écorce de Lepidodendron de 38 cm, motif en écailles caractéristique. Légère érosion de surface. Acquis auprès d''une ancienne collection privée.',
        315.000, 315.000, 0, 187, '2026-08-28 03:41:00',
        4, 9, 8,   51, 6, 5,   NULL, NULL),
    (75, 'Dent de Carcharodontosaure',
        'Dent de Carcharodontosaure de 11 cm, large et aplatie. Restauration mineure documentée.',
        95.000, 100.000, 1, 19, '2026-08-30 02:01:00',
        1, 4, 4,   19, 1, 9,   6, 10),
    (76, 'Écorce de Lepidodendron',
        'Écorce de Lepidodendron de 34 cm, motif en écailles caractéristique. Pièce conservée sur sa gangue d''origine.',
        310.000, 320.000, 0, 130, '2026-08-30 02:39:00',
        4, 9, 4,   51, 6, 5,   NULL, 10),
    (77, 'Coprolithe de dinosaure',
        'Coprolithe de dinosaure de 17 cm, fragments d''os visibles en coupe. Pièce nettoyée et préparée en laboratoire. Provenance exacte non documentée.',
        66.000, 68.000, 0, 121, '2026-08-30 22:03:00',
        5, 7, 8,   NULL, NULL, 9,   NULL, NULL),
    (78, 'Ammonite Promicroceras',
        'Ammonite Promicroceras de 4 cm, coupée et polie, cloisons calcifiées. Légère érosion de surface.',
        193.000, 195.000, 1, 129, '2026-09-05 08:57:00',
        2, 6, 8,   4, 6, 8,   4, NULL),
    (79, 'Défense de mammouth laineux',
        'Défense de mammouth laineux d''environ 1,8 m, incomplète, stries de croissance visibles. Très bon état de conservation. Acquis auprès d''une ancienne collection privée.',
        0.012, 0.050, 1, 53, '2026-09-05 09:14:00',
        1, 4, 10,   37, 6, 12,   NULL, NULL),
    (80, 'Œuf d''oviraptoridé',
        'Œuf d''oviraptoridé de 14 cm, allongé, coquille finement granuleuse. Quelques fissures stabilisées lors d''une restauration ancienne. Provenance exacte non documentée.',
        71.000, 75.000, 1, 105, '2026-09-13 21:12:00',
        1, 11, 4,   NULL, 5, 9,   NULL, NULL),
    (81, 'Feuille de Glossopteris',
        'Feuille de Glossopteris de 7 cm, en forme de langue, nervure centrale marquée. Très bon état de conservation. Provenance exacte non documentée.',
        NULL, NULL, 1, 67, '2026-09-16 18:17:00',
        4, 10, 3,   8, NULL, 6,   NULL, 9),
    (82, 'Ammonite Hildoceras',
        'Ammonite Hildoceras de 4 cm, sillon spiral caractéristique sur les flancs. Très bon état de conservation. Acquis auprès d''une ancienne collection privée.',
        180.000, 182.000, 1, 67, '2026-09-19 06:18:00',
        2, 6, 9,   44, 6, 8,   NULL, NULL),
    (83, 'Tibia d''Iguanodon de Bernissart',
        'Tibia d''Iguanodon de 67 cm, complet, légèrement écrasé. Pièce nettoyée et préparée en laboratoire.',
        125.000, 127.000, 1, 64, '2026-09-19 11:05:00',
        1, 16, 4,   25, 6, 9,   20, NULL),
    (84, 'Feuille de Ginkgo',
        'Feuille de Ginkgo de 7 cm, en éventail, nervures rayonnantes. Très bon état de conservation. Acquis auprès d''une ancienne collection privée.',
        58.000, 62.000, 1, 65, '2026-09-23 15:17:00',
        4, 10, 9,   55, NULL, 10,   NULL, NULL),
    (85, 'Trilobite Drotops d''Alnif',
        'Trilobite Drotops de 11 cm, préparé en relief sur sa gangue. Très bon état de conservation.',
        385.000, 390.000, 1, 20, '2026-09-24 00:27:00',
        2, 12, 7,   47, 1, 4,   23, NULL),
    (86, 'Scorpion de mer Eurypterus',
        'Scorpion de mer Eurypterus de 14 cm, carapace complète avec ses pattes nageuses. Restauration mineure documentée. Provenance exacte non documentée.',
        419.500, 423.000, 1, 153, '2026-09-24 05:31:00',
        2, 12, 10,   49, 2, 3,   NULL, NULL),
    (87, 'Fougère de Mazon Creek',
        'Fougère de Mazon Creek de 9 cm, dans un nodule de sidérite fendu en deux. Restauration mineure documentée.',
        307.000, 309.000, 0, 82, '2026-09-29 05:47:00',
        4, 10, 2,   NULL, 2, 5,   NULL, NULL),
    (88, 'Poisson Knightia de Green River',
        'Poisson Knightia de 17 cm, préparation manuelle soignée. Pièce conservée sur sa gangue d''origine.',
        51.500, 52.000, 1, 48, '2026-09-30 05:55:00',
        1, 1, 9,   31, 2, 10,   13, 28),
    (89, 'Vertèbre de Plésiosaure',
        'Vertèbre de Plésiosaure de 6 cm, cervicale, facettes articulaires nettes. Restauration mineure documentée. Acquis auprès d''une ancienne collection privée.',
        195.000, 199.000, 0, 354, '2026-10-05 21:37:00',
        1, 5, 5,   22, NULL, 8,   NULL, NULL),
    (90, 'Molaire de mammouth de Colomb',
        'Molaire de mammouth de Colomb de 26 cm, lames d''émail parallèles bien visibles. Pièce nettoyée et préparée en laboratoire.',
        0.010, 0.040, 1, 52, '2026-10-07 18:55:00',
        1, 4, 9,   36, 2, 12,   7, NULL),
    (91, 'Crâne de Lystrosaure du Karoo',
        'Crâne de Lystrosaure de 15 cm, deux défenses bien visibles. Restauration mineure documentée.',
        250.950, 250.950, 1, 408, '2026-10-09 17:18:00',
        1, 3, 6,   28, 1, NULL,   25, NULL),
    (92, 'Crâne de loup sinistre de La Brea',
        'Crâne de loup sinistre de 28 cm, complet, coloration sombre due à l''asphalte. Très bon état de conservation.',
        NULL, NULL, 1, 5, '2026-10-14 19:20:00',
        1, 3, 9,   35, 2, 12,   7, 7),
    (93, 'Guêpe dans l''ambre de Saint-Domingue',
        'Guêpe dans l''ambre de Saint-Domingue, ailes nervurées bien visibles. Pièce nettoyée et préparée en laboratoire. Provenance exacte non documentée.',
        16.000, 20.000, 1, 59, '2026-10-15 00:17:00',
        3, 13, 10,   NULL, 2, 11,   NULL, NULL),
    (94, 'Coprolithe de prédateur',
        'Coprolithe de prédateur de 11 cm, surface brune, forme spiralée. Quelques fissures stabilisées lors d''une restauration ancienne.',
        95.000, 100.000, 0, 197, '2026-10-16 06:17:00',
        5, 7, 2,   NULL, 1, 9,   6, NULL),
    (95, 'Eurotamandua',
        'Eurotamandua de 73 cm, squelette complet, griffes des pattes avant puissantes. Quelques fissures stabilisées lors d''une restauration ancienne.',
        NULL, NULL, 1, 293, '2026-10-18 02:34:00',
        1, 1, 9,   34, 6, 10,   5, NULL),
    (96, 'Ammonite Promicroceras de Lyme Regis',
        'Ammonite Promicroceras de 3 cm, pyritisée, reflets dorés. Pièce nettoyée et préparée en laboratoire.',
        193.000, 195.000, 0, 10, '2026-10-18 19:17:00',
        2, 6, 2,   4, 6, 8,   4, 11),
    (97, 'Vertèbre d''Ichthyosaure de Lyme Regis',
        'Vertèbre d''Ichthyosaure de 6 cm, en forme de disque, typique des ichthyosaures. Très bon état de conservation.',
        195.000, 199.000, 1, 53, '2026-10-18 21:40:00',
        1, 5, 8,   21, 6, 8,   4, NULL),
    (98, 'Dent de requin Otodus de Khouribga',
        'Dent de requin Otodus de 5 cm, bords lisses, deux petites cuspides latérales. Pièce nettoyée et préparée en laboratoire.',
        50.000, 58.000, 1, 39, '2026-10-20 20:21:00',
        1, 4, 1,   41, 1, 10,   22, NULL),
    (99, 'Dent de rhinocéros laineux',
        'Dent de rhinocéros laineux de 6 cm, prémolaire, racines conservées. Quelques fissures stabilisées lors d''une restauration ancienne. Provenance exacte non documentée.',
        0.012, 0.050, 1, 126, '2026-10-21 13:38:00',
        1, 4, 9,   38, 6, 12,   NULL, 28),
    (100, 'Confuciusornis du Liaoning',
        'Confuciusornis de 35 cm, ailes déployées, longues plumes de la queue visibles. Pièce conservée sur sa gangue d''origine.',
        122.500, 122.500, 0, 176, '2026-10-23 12:26:00',
        1, 1, 6,   18, 5, 9,   12, 27);

-- Favoris des paléontologues
INSERT INTO palaeontologist_fossil (id_user, id_fossil, saved_at) VALUES
    (2, 1, '2026-06-10 18:02:00'),
    (2, 3, '2026-06-10 18:05:00'),
    (2, 4, '2026-10-12 22:14:00'),
    (2, 6, '2026-09-08 20:26:00'),
    (2, 7, '2026-10-20 20:34:00'),
    (2, 32, '2026-10-20 19:39:00'),
    (2, 44, '2026-09-07 08:58:00'),
    (2, 48, '2026-09-16 11:09:00'),
    (2, 59, '2026-08-08 21:18:00'),
    (2, 63, '2026-10-06 20:17:00'),
    (2, 74, '2026-10-23 01:34:00'),
    (2, 76, '2026-09-13 06:20:00'),
    (2, 91, '2026-10-27 16:33:00'),
    (3, 1, '2026-07-11 09:30:00'),
    (3, 4, '2026-07-28 01:32:00'),
    (3, 6, '2026-07-11 09:34:00'),
    (3, 7, '2026-09-04 05:20:00'),
    (3, 10, '2026-09-20 21:15:00'),
    (3, 12, '2026-10-15 15:03:00'),
    (3, 23, '2026-10-25 08:08:00'),
    (3, 26, '2026-06-26 07:52:00'),
    (3, 30, '2026-07-03 22:15:00'),
    (3, 40, '2026-07-02 04:19:00'),
    (3, 56, '2026-09-13 09:07:00'),
    (3, 77, '2026-09-24 14:05:00'),
    (3, 87, '2026-10-12 15:34:00'),
    (3, 95, '2026-10-21 20:22:00'),
    (4, 1, '2026-10-24 10:03:00'),
    (4, 2, '2026-10-22 12:00:00'),
    (4, 32, '2026-10-24 23:21:00'),
    (4, 64, '2026-10-26 05:36:00'),
    (4, 77, '2026-10-24 00:07:00'),
    (4, 84, '2026-10-25 18:07:00'),
    (6, 12, '2026-10-13 08:47:00'),
    (6, 21, '2026-10-12 11:51:00'),
    (6, 23, '2026-06-03 04:24:00'),
    (6, 25, '2026-09-02 09:54:00'),
    (6, 32, '2026-08-22 12:12:00'),
    (6, 36, '2026-10-07 10:30:00'),
    (6, 39, '2026-07-12 17:16:00'),
    (6, 40, '2026-09-14 06:41:00'),
    (6, 53, '2026-10-06 10:06:00'),
    (6, 63, '2026-08-07 22:19:00'),
    (6, 74, '2026-09-13 22:12:00'),
    (6, 89, '2026-10-27 04:09:00');


-- =============================================================================
--  5. IMAGES ET CRÉDITS
-- =============================================================================

INSERT INTO credit (id_credit, credit_name, credit_link) VALUES
    (1, 'Équipe Paléo Curios', NULL),
    (2, 'Studio Fossilia', 'https://fossilia.example'),
    (3, 'Jean Morel', 'https://jean-morel-photo.example'),
    (4, 'Muséum de Belcastel', 'https://museum-belcastel.example'),
    (5, 'Ambres & Insectes', 'https://ambres-insectes.example'),
    (6, 'Institut de paléontologie du Rhône', 'https://institut-paleo-rhone.example'),
    (7, 'Musée de la Pierre Ancienne', 'https://pierre-ancienne.example');

INSERT INTO license (id_license, license_name, license_link) VALUES
    (1, 'CC BY 4.0',            'https://creativecommons.org/licenses/by/4.0/'),
    (2, 'CC BY-SA 4.0',         'https://creativecommons.org/licenses/by-sa/4.0/'),
    (3, 'CC0 1.0',              'https://creativecommons.org/publicdomain/zero/1.0/'),
    (4, 'Domaine public',       NULL),   -- non utilisée
    (5, 'Tous droits réservés', NULL);

-- Images 1 à 9 : carrousels des fossiles d'origine (id_fossil + position).
-- Images 10 et 11 : utilisées seulement dans des articles (id_fossil et position à NULL).
-- L'image 4 (Microraptor) sert à la fois au carrousel et dans un article.
-- Images 12 à 143 : carrousels des fossiles 13 à 100, de 0 à 3 images par fossile
-- (certains fossiles n'ont pas d'image : à gérer à l'affichage).
-- Le crédit dépend du propriétaire : un musée ou une entreprise fournit ses propres photos.
INSERT INTO picture (id_picture, picture_path, picture_alt, picture_title,
                     picture_source_link, picture_modification, picture_position,
                     id_credit, id_license, id_fossil) VALUES
    (1, 'img/fossils/archaeopteryx-belcastel-1.jpg',
        'Squelette d''archéoptéryx dans une dalle de calcaire clair, ailes déployées',
        'Archéoptéryx, vue d''ensemble', NULL, NULL, 1, 4, 5, 1),
    (2, 'img/fossils/archaeopteryx-belcastel-2.jpg',
        'Gros plan sur les empreintes de plumes de l''aile gauche',
        'Archéoptéryx, détail des plumes', NULL, NULL, 2, 4, 5, 1),
    (3, 'img/fossils/dent-tyrannosaure-1.jpg',
        'Dent de tyrannosaure posée sur un fond noir à côté d''une règle graduée',
        NULL, NULL, NULL, 1, 2, 5, 2),
    (4, 'img/fossils/microraptor-liaoning-1.jpg',
        'Squelette de microraptor aplati sur une plaque de schiste gris',
        'Microraptor gui', 'https://jean-morel-photo.example/microraptor', 'recadrée', 1, 3, 2, 3),
    (5, 'img/fossils/microraptor-liaoning-2.jpg',
        'Détail des plumes des pattes arrière du microraptor',
        'Microraptor gui, plumes des pattes', 'https://jean-morel-photo.example/microraptor', NULL, 2, 3, 2, 3),
    (6, 'img/fossils/smilodon-crane-1.jpg',
        'Crâne de smilodon de profil, canines supérieures très longues',
        NULL, NULL, NULL, 1, 1, 1, 6),
    (7, 'img/fossils/libellule-commentry-1.jpg',
        'Empreinte d''une grande aile d''insecte aux nervures très fines',
        NULL, NULL, 'contraste renforcé', 1, 1, 3, 7),
    (8, 'img/fossils/coprolithe-kemkem-1.jpg',
        'Coprolithe brun allongé, cassé en deux pour montrer son contenu',
        NULL, NULL, NULL, 1, 2, 5, 9),
    (9, 'img/fossils/oiseau-messel-1.jpg',
        'Petit squelette d''oiseau sombre sur une plaque de schiste brun',
        'Messelornis cristata', NULL, NULL, 1, 4, 5, 12),
    (10, 'img/articles/schema-fossilisation.png',
        'Schéma en quatre étapes : mort de l''animal, enfouissement, minéralisation, érosion',
        'Les étapes de la fossilisation', NULL, NULL, NULL, 1, 1, NULL),
    (11, 'img/articles/microraptor-reconstitution.jpg',
        'Reconstitution d''un microraptor au plumage noir, planant entre deux arbres',
        'Reconstitution de Microraptor', 'https://jean-morel-photo.example/reconstitutions',
        'couleurs ajustées', NULL, 3, 2, NULL),
    -- ---- Carrousels des fossiles 13 à 100 ----
    (12, 'img/fossils/013-mesosaure-1.jpg',
        'Mésosaure, à côté d''une échelle graduée',
        NULL, NULL, NULL, 1, 6, 5, 13),
    (13, 'img/fossils/013-mesosaure-2.jpg',
        'Mésosaure, vue de dessus',
        NULL, NULL, NULL, 2, 6, 5, 13),
    (14, 'img/fossils/014-dent-de-spinosaure-1.jpg',
        'Dent de Spinosaure, vue de profil',
        NULL, NULL, 'luminosité ajustée', 1, 7, 5, 14),
    (15, 'img/fossils/014-dent-de-spinosaure-2.jpg',
        'Dent de Spinosaure, détail de la surface',
        NULL, NULL, NULL, 2, 7, 5, 14),
    (16, 'img/fossils/015-trilobite-eldredgeops-1.jpg',
        'Trilobite Eldredgeops, à côté d''une échelle graduée',
        NULL, NULL, 'fond détouré', 1, 6, 5, 15),
    (17, 'img/fossils/015-trilobite-eldredgeops-2.jpg',
        'Trilobite Eldredgeops, vue de profil',
        NULL, NULL, NULL, 2, 6, 5, 15),
    (18, 'img/fossils/015-trilobite-eldredgeops-3.jpg',
        'Trilobite Eldredgeops, vue d''ensemble',
        NULL, NULL, NULL, 3, 6, 5, 15),
    (19, 'img/fossils/016-dent-de-megalodon-1.jpg',
        'Dent de Mégalodon, détail de la surface',
        NULL, 'https://jean-morel-photo.example/dent-de-megalodon', 'fond détouré', 1, 3, 2, 16),
    (20, 'img/fossils/016-dent-de-megalodon-2.jpg',
        'Dent de Mégalodon, vue de dessus',
        NULL, 'https://jean-morel-photo.example/dent-de-megalodon', NULL, 2, 3, 2, 16),
    (21, 'img/fossils/017-vertebre-d-edmontosaure-de-hell-creek-1.jpg',
        'Vertèbre d''Edmontosaure de Hell Creek, vue d''ensemble',
        NULL, NULL, 'luminosité ajustée', 1, 6, 5, 17),
    (22, 'img/fossils/017-vertebre-d-edmontosaure-de-hell-creek-2.jpg',
        'Vertèbre d''Edmontosaure de Hell Creek, à côté d''une échelle graduée',
        NULL, NULL, 'luminosité ajustée', 2, 6, 5, 17),
    (23, 'img/fossils/018-coleoptere-dans-l-ambre-de-la-baltique-1.jpg',
        'Coléoptère dans l''ambre de la Baltique, vue d''ensemble',
        NULL, NULL, 'fond détouré', 1, 5, 5, 18),
    (24, 'img/fossils/019-trilobite-elrathia-de-l-utah-1.jpg',
        'Trilobite Elrathia de l''Utah, vue de profil',
        NULL, NULL, NULL, 1, 1, 1, 19),
    (25, 'img/fossils/019-trilobite-elrathia-de-l-utah-2.jpg',
        'Trilobite Elrathia de l''Utah, vue de dessus',
        NULL, NULL, 'luminosité ajustée', 2, 1, 1, 19),
    (26, 'img/fossils/020-dent-de-requin-otodus-1.jpg',
        'Dent de requin Otodus, détail de la surface',
        NULL, NULL, NULL, 1, 7, 1, 20),
    (27, 'img/fossils/020-dent-de-requin-otodus-2.jpg',
        'Dent de requin Otodus, vue d''ensemble',
        NULL, NULL, NULL, 2, 7, 1, 20),
    (28, 'img/fossils/020-dent-de-requin-otodus-3.jpg',
        'Dent de requin Otodus, vue de dessus',
        NULL, NULL, 'luminosité ajustée', 3, 7, 1, 20),
    (29, 'img/fossils/021-feuillage-d-annularia-1.jpg',
        'Feuillage d''Annularia, vue de dessus',
        NULL, NULL, NULL, 1, 7, 5, 21),
    (30, 'img/fossils/021-feuillage-d-annularia-2.jpg',
        'Feuillage d''Annularia, vue d''ensemble',
        NULL, NULL, NULL, 2, 7, 5, 21),
    (31, 'img/fossils/021-feuillage-d-annularia-3.jpg',
        'Feuillage d''Annularia, détail de la surface',
        NULL, NULL, NULL, 3, 7, 5, 21),
    (32, 'img/fossils/022-bois-petrifie-d-araucarioxylon-1.jpg',
        'Bois pétrifié d''Araucarioxylon, vue de dessus',
        NULL, NULL, NULL, 1, 6, 5, 22),
    (33, 'img/fossils/023-oiseau-de-messel-1.jpg',
        'Oiseau de Messel, vue d''ensemble',
        NULL, NULL, NULL, 1, 7, 5, 23),
    (34, 'img/fossils/024-poisson-diplomystus-1.jpg',
        'Poisson Diplomystus, vue de profil',
        NULL, NULL, 'recadrée', 1, 4, 1, 24),
    (35, 'img/fossils/024-poisson-diplomystus-2.jpg',
        'Poisson Diplomystus, vue d''ensemble',
        NULL, NULL, NULL, 2, 4, 1, 24),
    (36, 'img/fossils/024-poisson-diplomystus-3.jpg',
        'Poisson Diplomystus, à côté d''une échelle graduée',
        NULL, NULL, NULL, 3, 4, 1, 24),
    (37, 'img/fossils/025-dent-d-allosaure-1.jpg',
        'Dent d''Allosaure, vue de profil',
        NULL, NULL, 'luminosité ajustée', 1, 7, 5, 25),
    (38, 'img/fossils/027-trilobite-elrathia-de-l-utah-1.jpg',
        'Trilobite Elrathia de l''Utah, détail de la surface',
        NULL, NULL, 'luminosité ajustée', 1, 1, 1, 27),
    (39, 'img/fossils/028-ammonite-promicroceras-1.jpg',
        'Ammonite Promicroceras, vue de dessus',
        NULL, NULL, 'fond détouré', 1, 2, 1, 28),
    (40, 'img/fossils/028-ammonite-promicroceras-2.jpg',
        'Ammonite Promicroceras, vue d''ensemble',
        NULL, NULL, 'recadrée', 2, 2, 1, 28),
    (41, 'img/fossils/028-ammonite-promicroceras-3.jpg',
        'Ammonite Promicroceras, vue de profil',
        NULL, NULL, NULL, 3, 2, 1, 28),
    (42, 'img/fossils/029-oursin-micraster-1.jpg',
        'Oursin Micraster, détail de la surface',
        NULL, 'https://jean-morel-photo.example/oursin-micraster', NULL, 1, 3, 2, 29),
    (43, 'img/fossils/029-oursin-micraster-2.jpg',
        'Oursin Micraster, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/oursin-micraster', NULL, 2, 3, 2, 29),
    (44, 'img/fossils/029-oursin-micraster-3.jpg',
        'Oursin Micraster, à côté d''une échelle graduée',
        NULL, 'https://jean-morel-photo.example/oursin-micraster', NULL, 3, 3, 2, 29),
    (45, 'img/fossils/030-ichthyosaure-stenopterygius-de-holzmaden-1.jpg',
        'Ichthyosaure Sténoptérygius de Holzmaden, détail de la surface',
        NULL, NULL, NULL, 1, 4, 5, 30),
    (46, 'img/fossils/031-coprolithe-de-dinosaure-1.jpg',
        'Coprolithe de dinosaure, vue de profil',
        NULL, NULL, NULL, 1, 7, 5, 31),
    (47, 'img/fossils/031-coprolithe-de-dinosaure-2.jpg',
        'Coprolithe de dinosaure, à côté d''une échelle graduée',
        NULL, NULL, 'recadrée', 2, 7, 5, 31),
    (48, 'img/fossils/032-molaire-de-mammouth-de-colomb-de-la-brea-1.jpg',
        'Molaire de mammouth de Colomb de La Brea, détail de la surface',
        NULL, NULL, 'luminosité ajustée', 1, 7, 5, 32),
    (49, 'img/fossils/032-molaire-de-mammouth-de-colomb-de-la-brea-2.jpg',
        'Molaire de mammouth de Colomb de La Brea, vue de dessus',
        NULL, NULL, NULL, 2, 7, 5, 32),
    (50, 'img/fossils/032-molaire-de-mammouth-de-colomb-de-la-brea-3.jpg',
        'Molaire de mammouth de Colomb de La Brea, vue d''ensemble',
        NULL, NULL, NULL, 3, 7, 5, 32),
    (51, 'img/fossils/035-trilobite-calymene-de-dudley-1.jpg',
        'Trilobite Calymene de Dudley, détail de la surface',
        NULL, 'https://jean-morel-photo.example/trilobite-calymene-de-dudley', 'fond détouré', 1, 3, 2, 35),
    (52, 'img/fossils/035-trilobite-calymene-de-dudley-2.jpg',
        'Trilobite Calymene de Dudley, à côté d''une échelle graduée',
        NULL, 'https://jean-morel-photo.example/trilobite-calymene-de-dudley', NULL, 2, 3, 2, 35),
    (53, 'img/fossils/035-trilobite-calymene-de-dudley-3.jpg',
        'Trilobite Calymene de Dudley, vue de dessus',
        NULL, 'https://jean-morel-photo.example/trilobite-calymene-de-dudley', 'luminosité ajustée', 3, 3, 2, 35),
    (54, 'img/fossils/036-coleoptere-dans-l-ambre-de-la-baltique-1.jpg',
        'Coléoptère dans l''ambre de la Baltique, vue de dessus',
        NULL, NULL, 'fond détouré', 1, 5, 1, 36),
    (55, 'img/fossils/036-coleoptere-dans-l-ambre-de-la-baltique-2.jpg',
        'Coléoptère dans l''ambre de la Baltique, vue d''ensemble',
        NULL, NULL, NULL, 2, 5, 1, 36),
    (56, 'img/fossils/038-coprolithe-de-reptile-marin-1.jpg',
        'Coprolithe de reptile marin, détail de la surface',
        NULL, NULL, NULL, 1, 2, 5, 38),
    (57, 'img/fossils/038-coprolithe-de-reptile-marin-2.jpg',
        'Coprolithe de reptile marin, vue d''ensemble',
        NULL, NULL, 'luminosité ajustée', 2, 2, 5, 38),
    (58, 'img/fossils/039-oiseau-de-messel-1.jpg',
        'Oiseau de Messel, vue d''ensemble',
        NULL, NULL, NULL, 1, 7, 5, 39),
    (59, 'img/fossils/039-oiseau-de-messel-2.jpg',
        'Oiseau de Messel, à côté d''une échelle graduée',
        NULL, NULL, NULL, 2, 7, 5, 39),
    (60, 'img/fossils/039-oiseau-de-messel-3.jpg',
        'Oiseau de Messel, vue de profil',
        NULL, NULL, NULL, 3, 7, 5, 39),
    (61, 'img/fossils/040-griffe-de-velociraptor-de-bayanzag-1.jpg',
        'Griffe de Vélociraptor de Bayanzag, à côté d''une échelle graduée',
        NULL, NULL, NULL, 1, 7, 5, 40),
    (62, 'img/fossils/041-ammonite-asteroceras-1.jpg',
        'Ammonite Asteroceras, à côté d''une échelle graduée',
        NULL, NULL, NULL, 1, 4, 5, 41),
    (63, 'img/fossils/041-ammonite-asteroceras-2.jpg',
        'Ammonite Asteroceras, vue de profil',
        NULL, NULL, 'luminosité ajustée', 2, 4, 5, 41),
    (64, 'img/fossils/042-monstre-de-tully-de-mazon-creek-1.jpg',
        'Monstre de Tully de Mazon Creek, détail de la surface',
        NULL, 'https://jean-morel-photo.example/monstre-de-tully-de-mazon-creek', NULL, 1, 3, 2, 42),
    (65, 'img/fossils/043-guepe-dans-l-ambre-de-saint-domingue-1.jpg',
        'Guêpe dans l''ambre de Saint-Domingue, vue de profil',
        NULL, NULL, 'fond détouré', 1, 1, 3, 43),
    (66, 'img/fossils/044-poisson-dapedium-de-lyme-regis-1.jpg',
        'Poisson Dapedium de Lyme Regis, vue de profil',
        NULL, NULL, 'luminosité ajustée', 1, 6, 1, 44),
    (67, 'img/fossils/044-poisson-dapedium-de-lyme-regis-2.jpg',
        'Poisson Dapedium de Lyme Regis, vue d''ensemble',
        NULL, NULL, NULL, 2, 6, 1, 44),
    (68, 'img/fossils/044-poisson-dapedium-de-lyme-regis-3.jpg',
        'Poisson Dapedium de Lyme Regis, détail de la surface',
        NULL, NULL, NULL, 3, 6, 1, 44),
    (69, 'img/fossils/045-plaque-dorsale-de-stegosaure-1.jpg',
        'Plaque dorsale de Stégosaure, vue de profil',
        NULL, NULL, NULL, 1, 1, 3, 45),
    (70, 'img/fossils/046-dent-de-mosasaure-de-maastricht-1.jpg',
        'Dent de Mosasaure de Maastricht, vue de dessus',
        NULL, NULL, 'recadrée', 1, 4, 5, 46),
    (71, 'img/fossils/046-dent-de-mosasaure-de-maastricht-2.jpg',
        'Dent de Mosasaure de Maastricht, vue de profil',
        NULL, NULL, 'fond détouré', 2, 4, 5, 46),
    (72, 'img/fossils/047-coleoptere-dans-l-ambre-de-la-baltique-1.jpg',
        'Coléoptère dans l''ambre de la Baltique, vue d''ensemble',
        NULL, NULL, 'luminosité ajustée', 1, 5, 5, 47),
    (73, 'img/fossils/047-coleoptere-dans-l-ambre-de-la-baltique-2.jpg',
        'Coléoptère dans l''ambre de la Baltique, vue de dessus',
        NULL, NULL, 'luminosité ajustée', 2, 5, 5, 47),
    (74, 'img/fossils/047-coleoptere-dans-l-ambre-de-la-baltique-3.jpg',
        'Coléoptère dans l''ambre de la Baltique, détail de la surface',
        NULL, NULL, 'fond détouré', 3, 5, 5, 47),
    (75, 'img/fossils/048-trilobite-elrathia-de-l-utah-1.jpg',
        'Trilobite Elrathia de l''Utah, détail de la surface',
        NULL, NULL, NULL, 1, 1, 3, 48),
    (76, 'img/fossils/049-canine-d-ours-des-cavernes-1.jpg',
        'Canine d''ours des cavernes, vue de profil',
        NULL, NULL, 'fond détouré', 1, 4, 5, 49),
    (77, 'img/fossils/050-termite-dans-l-ambre-de-saint-domingue-1.jpg',
        'Termite dans l''ambre de Saint-Domingue, vue de dessus',
        NULL, NULL, 'fond détouré', 1, 5, 5, 50),
    (78, 'img/fossils/050-termite-dans-l-ambre-de-saint-domingue-2.jpg',
        'Termite dans l''ambre de Saint-Domingue, détail de la surface',
        NULL, NULL, 'recadrée', 2, 5, 5, 50),
    (79, 'img/fossils/051-confuciusornis-du-liaoning-1.jpg',
        'Confuciusornis du Liaoning, vue de profil',
        NULL, NULL, 'recadrée', 1, 7, 1, 51),
    (80, 'img/fossils/051-confuciusornis-du-liaoning-2.jpg',
        'Confuciusornis du Liaoning, à côté d''une échelle graduée',
        NULL, NULL, 'fond détouré', 2, 7, 1, 51),
    (81, 'img/fossils/053-psittacosaure-1.jpg',
        'Psittacosaure, vue d''ensemble',
        NULL, NULL, NULL, 1, 6, 5, 53),
    (82, 'img/fossils/053-psittacosaure-2.jpg',
        'Psittacosaure, vue de profil',
        NULL, NULL, 'recadrée', 2, 6, 5, 53),
    (83, 'img/fossils/053-psittacosaure-3.jpg',
        'Psittacosaure, détail de la surface',
        NULL, NULL, NULL, 3, 6, 5, 53),
    (84, 'img/fossils/054-crane-de-protoceratops-de-bayanzag-1.jpg',
        'Crâne de Protocératops de Bayanzag, vue de profil',
        NULL, NULL, 'luminosité ajustée', 1, 6, 5, 54),
    (85, 'img/fossils/055-scarabee-de-messel-1.jpg',
        'Scarabée de Messel, détail de la surface',
        NULL, NULL, NULL, 1, 7, 5, 55),
    (86, 'img/fossils/057-tige-de-calamites-de-commentry-1.jpg',
        'Tige de Calamites de Commentry, détail de la surface',
        NULL, NULL, 'fond détouré', 1, 4, 5, 57),
    (87, 'img/fossils/057-tige-de-calamites-de-commentry-2.jpg',
        'Tige de Calamites de Commentry, vue d''ensemble',
        NULL, NULL, 'fond détouré', 2, 4, 5, 57),
    (88, 'img/fossils/057-tige-de-calamites-de-commentry-3.jpg',
        'Tige de Calamites de Commentry, à côté d''une échelle graduée',
        NULL, NULL, NULL, 3, 4, 5, 57),
    (89, 'img/fossils/058-monstre-de-tully-de-mazon-creek-1.jpg',
        'Monstre de Tully de Mazon Creek, à côté d''une échelle graduée',
        NULL, 'https://jean-morel-photo.example/monstre-de-tully-de-mazon-creek', NULL, 1, 3, 2, 58),
    (90, 'img/fossils/059-empreinte-de-pas-de-reptile-1.jpg',
        'Empreinte de pas de reptile, vue de profil',
        NULL, NULL, NULL, 1, 4, 5, 59),
    (91, 'img/fossils/059-empreinte-de-pas-de-reptile-2.jpg',
        'Empreinte de pas de reptile, vue de dessus',
        NULL, NULL, NULL, 2, 4, 5, 59),
    (92, 'img/fossils/059-empreinte-de-pas-de-reptile-3.jpg',
        'Empreinte de pas de reptile, détail de la surface',
        NULL, NULL, 'recadrée', 3, 4, 5, 59),
    (93, 'img/fossils/060-femur-de-smilodon-de-la-brea-1.jpg',
        'Fémur de Smilodon de La Brea, vue de dessus',
        NULL, 'https://jean-morel-photo.example/femur-de-smilodon-de-la-brea', 'fond détouré', 1, 3, 2, 60),
    (94, 'img/fossils/061-crane-de-loup-sinistre-de-la-brea-1.jpg',
        'Crâne de loup sinistre de La Brea, détail de la surface',
        NULL, NULL, NULL, 1, 1, 1, 61),
    (95, 'img/fossils/063-feuille-de-glossopteris-1.jpg',
        'Feuille de Glossopteris, détail de la surface',
        NULL, NULL, NULL, 1, 6, 5, 63),
    (96, 'img/fossils/063-feuille-de-glossopteris-2.jpg',
        'Feuille de Glossopteris, vue d''ensemble',
        NULL, NULL, NULL, 2, 6, 5, 63),
    (97, 'img/fossils/063-feuille-de-glossopteris-3.jpg',
        'Feuille de Glossopteris, à côté d''une échelle graduée',
        NULL, NULL, NULL, 3, 6, 5, 63),
    (98, 'img/fossils/065-squelette-de-coelophysis-1.jpg',
        'Squelette de Cœlophysis, vue de dessus',
        NULL, NULL, NULL, 1, 2, 5, 65),
    (99, 'img/fossils/066-dent-de-triceratops-de-hell-creek-1.jpg',
        'Dent de Tricératops de Hell Creek, vue de dessus',
        NULL, NULL, 'recadrée', 1, 5, 5, 66),
    (100, 'img/fossils/067-vertebre-de-tyrannosaure-de-hell-creek-1.jpg',
        'Vertèbre de Tyrannosaure de Hell Creek, vue de profil',
        NULL, NULL, 'fond détouré', 1, 1, 1, 67),
    (101, 'img/fossils/067-vertebre-de-tyrannosaure-de-hell-creek-2.jpg',
        'Vertèbre de Tyrannosaure de Hell Creek, vue d''ensemble',
        NULL, NULL, NULL, 2, 1, 1, 67),
    (102, 'img/fossils/069-dent-de-megalodon-1.jpg',
        'Dent de Mégalodon, vue d''ensemble',
        NULL, NULL, NULL, 1, 4, 5, 69),
    (103, 'img/fossils/070-moucheron-dans-l-ambre-de-la-baltique-1.jpg',
        'Moucheron dans l''ambre de la Baltique, détail de la surface',
        NULL, NULL, 'luminosité ajustée', 1, 5, 5, 70),
    (104, 'img/fossils/070-moucheron-dans-l-ambre-de-la-baltique-2.jpg',
        'Moucheron dans l''ambre de la Baltique, à côté d''une échelle graduée',
        NULL, NULL, 'fond détouré', 2, 5, 5, 70),
    (105, 'img/fossils/071-perche-mioplosus-1.jpg',
        'Perche Mioplosus, à côté d''une échelle graduée',
        NULL, NULL, 'recadrée', 1, 1, 3, 71),
    (106, 'img/fossils/072-dent-de-requin-otodus-de-khouribga-1.jpg',
        'Dent de requin Otodus de Khouribga, à côté d''une échelle graduée',
        NULL, NULL, NULL, 1, 1, 1, 72),
    (107, 'img/fossils/073-empreinte-de-pas-de-theropode-1.jpg',
        'Empreinte de pas de théropode, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/empreinte-de-pas-de-theropode', NULL, 1, 3, 2, 73),
    (108, 'img/fossils/074-ecorce-de-lepidodendron-1.jpg',
        'Écorce de Lepidodendron, vue de dessus',
        NULL, NULL, 'recadrée', 1, 5, 5, 74),
    (109, 'img/fossils/074-ecorce-de-lepidodendron-2.jpg',
        'Écorce de Lepidodendron, vue de profil',
        NULL, NULL, 'fond détouré', 2, 5, 5, 74),
    (110, 'img/fossils/076-ecorce-de-lepidodendron-1.jpg',
        'Écorce de Lepidodendron, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/ecorce-de-lepidodendron', 'luminosité ajustée', 1, 3, 2, 76),
    (111, 'img/fossils/077-coprolithe-de-dinosaure-1.jpg',
        'Coprolithe de dinosaure, vue de profil',
        NULL, NULL, NULL, 1, 5, 5, 77),
    (112, 'img/fossils/078-ammonite-promicroceras-1.jpg',
        'Ammonite Promicroceras, vue de dessus',
        NULL, NULL, 'recadrée', 1, 5, 5, 78),
    (113, 'img/fossils/079-defense-de-mammouth-laineux-1.jpg',
        'Défense de mammouth laineux, détail de la surface',
        NULL, NULL, NULL, 1, 1, 3, 79),
    (114, 'img/fossils/080-oeuf-d-oviraptoride-1.jpg',
        'Œuf d''oviraptoridé, à côté d''une échelle graduée',
        NULL, 'https://jean-morel-photo.example/oeuf-d-oviraptoride', NULL, 1, 3, 2, 80),
    (115, 'img/fossils/082-ammonite-hildoceras-1.jpg',
        'Ammonite Hildoceras, détail de la surface',
        NULL, NULL, 'luminosité ajustée', 1, 6, 5, 82),
    (116, 'img/fossils/082-ammonite-hildoceras-2.jpg',
        'Ammonite Hildoceras, à côté d''une échelle graduée',
        NULL, NULL, 'luminosité ajustée', 2, 6, 5, 82),
    (117, 'img/fossils/083-tibia-d-iguanodon-de-bernissart-1.jpg',
        'Tibia d''Iguanodon de Bernissart, détail de la surface',
        NULL, 'https://jean-morel-photo.example/tibia-d-iguanodon-de-bernissart', 'luminosité ajustée', 1, 3, 2, 83),
    (118, 'img/fossils/083-tibia-d-iguanodon-de-bernissart-2.jpg',
        'Tibia d''Iguanodon de Bernissart, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/tibia-d-iguanodon-de-bernissart', 'luminosité ajustée', 2, 3, 2, 83),
    (119, 'img/fossils/083-tibia-d-iguanodon-de-bernissart-3.jpg',
        'Tibia d''Iguanodon de Bernissart, vue de profil',
        NULL, 'https://jean-morel-photo.example/tibia-d-iguanodon-de-bernissart', NULL, 3, 3, 2, 83),
    (120, 'img/fossils/085-trilobite-drotops-d-alnif-1.jpg',
        'Trilobite Drotops d''Alnif, vue de dessus',
        NULL, NULL, NULL, 1, 1, 3, 85),
    (121, 'img/fossils/085-trilobite-drotops-d-alnif-2.jpg',
        'Trilobite Drotops d''Alnif, détail de la surface',
        NULL, NULL, 'fond détouré', 2, 1, 3, 85),
    (122, 'img/fossils/086-scorpion-de-mer-eurypterus-1.jpg',
        'Scorpion de mer Eurypterus, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/scorpion-de-mer-eurypterus', 'luminosité ajustée', 1, 3, 2, 86),
    (123, 'img/fossils/086-scorpion-de-mer-eurypterus-2.jpg',
        'Scorpion de mer Eurypterus, vue de dessus',
        NULL, 'https://jean-morel-photo.example/scorpion-de-mer-eurypterus', 'luminosité ajustée', 2, 3, 2, 86),
    (124, 'img/fossils/086-scorpion-de-mer-eurypterus-3.jpg',
        'Scorpion de mer Eurypterus, détail de la surface',
        NULL, 'https://jean-morel-photo.example/scorpion-de-mer-eurypterus', 'recadrée', 3, 3, 2, 86),
    (125, 'img/fossils/087-fougere-de-mazon-creek-1.jpg',
        'Fougère de Mazon Creek, vue de dessus',
        NULL, NULL, NULL, 1, 2, 5, 87),
    (126, 'img/fossils/089-vertebre-de-plesiosaure-1.jpg',
        'Vertèbre de Plésiosaure, vue de dessus',
        NULL, 'https://jean-morel-photo.example/vertebre-de-plesiosaure', NULL, 1, 3, 2, 89),
    (127, 'img/fossils/089-vertebre-de-plesiosaure-2.jpg',
        'Vertèbre de Plésiosaure, détail de la surface',
        NULL, 'https://jean-morel-photo.example/vertebre-de-plesiosaure', 'recadrée', 2, 3, 2, 89),
    (128, 'img/fossils/089-vertebre-de-plesiosaure-3.jpg',
        'Vertèbre de Plésiosaure, vue de profil',
        NULL, 'https://jean-morel-photo.example/vertebre-de-plesiosaure', 'luminosité ajustée', 3, 3, 2, 89),
    (129, 'img/fossils/091-crane-de-lystrosaure-du-karoo-1.jpg',
        'Crâne de Lystrosaure du Karoo, à côté d''une échelle graduée',
        NULL, NULL, 'recadrée', 1, 7, 5, 91),
    (130, 'img/fossils/091-crane-de-lystrosaure-du-karoo-2.jpg',
        'Crâne de Lystrosaure du Karoo, détail de la surface',
        NULL, NULL, NULL, 2, 7, 5, 91),
    (131, 'img/fossils/091-crane-de-lystrosaure-du-karoo-3.jpg',
        'Crâne de Lystrosaure du Karoo, vue de profil',
        NULL, NULL, NULL, 3, 7, 5, 91),
    (132, 'img/fossils/093-guepe-dans-l-ambre-de-saint-domingue-1.jpg',
        'Guêpe dans l''ambre de Saint-Domingue, vue de profil',
        NULL, 'https://jean-morel-photo.example/guepe-dans-l-ambre-de-saint-domingue', NULL, 1, 3, 2, 93),
    (133, 'img/fossils/093-guepe-dans-l-ambre-de-saint-domingue-2.jpg',
        'Guêpe dans l''ambre de Saint-Domingue, vue d''ensemble',
        NULL, 'https://jean-morel-photo.example/guepe-dans-l-ambre-de-saint-domingue', NULL, 2, 3, 2, 93),
    (134, 'img/fossils/094-coprolithe-de-predateur-1.jpg',
        'Coprolithe de prédateur, à côté d''une échelle graduée',
        NULL, NULL, 'recadrée', 1, 2, 5, 94),
    (135, 'img/fossils/094-coprolithe-de-predateur-2.jpg',
        'Coprolithe de prédateur, vue de dessus',
        NULL, NULL, NULL, 2, 2, 5, 94),
    (136, 'img/fossils/095-eurotamandua-1.jpg',
        'Eurotamandua, vue de dessus',
        NULL, NULL, NULL, 1, 6, 1, 95),
    (137, 'img/fossils/095-eurotamandua-2.jpg',
        'Eurotamandua, vue d''ensemble',
        NULL, NULL, NULL, 2, 6, 1, 95),
    (138, 'img/fossils/097-vertebre-d-ichthyosaure-de-lyme-regis-1.jpg',
        'Vertèbre d''Ichthyosaure de Lyme Regis, à côté d''une échelle graduée',
        NULL, NULL, NULL, 1, 5, 5, 97),
    (139, 'img/fossils/098-dent-de-requin-otodus-de-khouribga-1.jpg',
        'Dent de requin Otodus de Khouribga, vue de dessus',
        NULL, NULL, NULL, 1, 1, 1, 98),
    (140, 'img/fossils/099-dent-de-rhinoceros-laineux-1.jpg',
        'Dent de rhinocéros laineux, vue d''ensemble',
        NULL, NULL, 'fond détouré', 1, 6, 5, 99),
    (141, 'img/fossils/099-dent-de-rhinoceros-laineux-2.jpg',
        'Dent de rhinocéros laineux, vue de profil',
        NULL, NULL, 'fond détouré', 2, 6, 5, 99),
    (142, 'img/fossils/100-confuciusornis-du-liaoning-1.jpg',
        'Confuciusornis du Liaoning, vue de profil',
        NULL, NULL, 'recadrée', 1, 7, 1, 100),
    (143, 'img/fossils/100-confuciusornis-du-liaoning-2.jpg',
        'Confuciusornis du Liaoning, vue d''ensemble',
        NULL, NULL, NULL, 2, 7, 1, 100);


-- =============================================================================
--  6. ARTICLES
-- =============================================================================

-- Aucun auteur n'est rattaché à un compte (id_user à NULL).
-- Camille Durand est aussi paléontologue (compte n° 2), mais sa fiche d'autrice
-- est indépendante de ce compte.
INSERT INTO author (id_author, author_first_name, author_last_name, id_user) VALUES
    (1, 'Camille', 'Durand', NULL),
    (2, 'Thomas',  'Girard', NULL),
    (3, 'Inès',    'Roux',   NULL);

-- article_last_updated_at reste à NULL tant que l'article n'a jamais été modifié
-- (articles 2 et 3).
INSERT INTO article (id_article, article_title, article_introduction,
                     article_published_at, article_last_updated_at) VALUES
    (1, 'Microraptor, le petit dinosaure à quatre ailes',
        'Avec des plumes sur les bras et sur les jambes, Microraptor a bousculé ce que l''on pensait savoir de l''origine du vol.',
        '2026-06-15 09:00:00', '2026-06-20 18:30:00'),
    (2, 'Comment un être vivant devient-il un fossile ?',
        'Très peu d''organismes deviennent des fossiles. Retour sur les conditions exceptionnelles qui le permettent.',
        '2026-07-02 08:00:00', NULL),
    (3, 'Les coprolithes, des fossiles pas comme les autres',
        'Ils sont peu spectaculaires, mais les excréments fossilisés révèlent ce que mangeaient les animaux disparus.',
        '2026-10-20 16:45:00', NULL);

-- L'article 1 a deux auteurs, dans un ordre précis.
INSERT INTO author_article (id_author, id_article, author_position) VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 1),
    (1, 3, 1);

-- Sections : la première de chaque article n'a pas de titre (introduction).
INSERT INTO section (id_section, section_title, section_position, id_article) VALUES
    (1, NULL,                                      1, 1),
    (2, 'Des plumes sur les quatre membres',       2, 1),
    (3, 'Planer d''arbre en arbre',                3, 1),
    (4, NULL,                                      1, 2),
    (5, 'Les conditions de la fossilisation',      2, 2),
    (6, 'Du sédiment à la roche',                  3, 2),
    (7, NULL,                                      1, 3),
    (8, 'Ce que les coprolithes nous apprennent',  2, 3);

-- Blocs : chaque bloc doit avoir exactement une ligne dans la sous-table
-- qui correspond à son block_type (paragraph_block ou image_block).
INSERT INTO block (id_block, block_type, block_position, id_section) VALUES
    (1,  'paragraph', 1, 1),
    (2,  'image',     2, 1),
    (3,  'paragraph', 1, 2),
    (4,  'paragraph', 2, 2),
    (5,  'image',     1, 3),
    (6,  'paragraph', 2, 3),
    (7,  'paragraph', 1, 4),
    (8,  'paragraph', 1, 5),
    (9,  'image',     2, 5),
    (10, 'paragraph', 3, 5),
    (11, 'paragraph', 1, 6),
    (12, 'image',     2, 6),
    (13, 'paragraph', 1, 7),
    (14, 'paragraph', 1, 8),
    (15, 'image',     2, 8);

INSERT INTO paragraph_block (id_block, paragraph_text) VALUES
    (1,  'Découvert au début des années 2000 dans le nord-est de la Chine, Microraptor est un petit dinosaure carnivore d''environ 80 cm de long, qui vivait il y a quelque 120 millions d''années.'),
    (3,  'Ce qui le rend unique, ce sont ses longues plumes de vol, présentes non seulement sur les bras mais aussi sur les pattes arrière. Il possédait ainsi quatre surfaces portantes.'),
    (4,  'L''étude de structures microscopiques conservées dans les plumes a même permis de proposer une couleur : un plumage noir aux reflets irisés.'),
    (6,  'Les chercheurs pensent que Microraptor était capable de planer, voire de voler sur de courtes distances, ce qui en fait un témoin important de l''évolution du vol chez les dinosaures.'),
    (7,  'Lorsqu''un animal ou une plante meurt, ses restes sont presque toujours détruits par les charognards, les bactéries et les intempéries. La fossilisation est une exception.'),
    (8,  'Pour qu''un fossile se forme, les restes doivent être recouverts rapidement par des sédiments, comme de la boue, du sable ou des cendres volcaniques. Ils sont alors à l''abri de l''oxygène et des prédateurs.'),
    (10, 'Les parties dures, comme les os, les dents ou les coquilles, se conservent bien mieux que les tissus mous. C''est pourquoi les empreintes de plumes ou de peau sont si précieuses.'),
    (11, 'Au fil de millions d''années, les sédiments se transforment en roche. L''eau qui circule dépose des minéraux dans les restes, qui deviennent peu à peu de la pierre : c''est la minéralisation.'),
    (13, 'Le mot coprolithe vient du grec kopros, « excrément », et lithos, « pierre ». Ces fossiles ont été décrits pour la première fois au XIXe siècle.'),
    (14, 'En analysant leur contenu, on retrouve des fragments d''os, d''écailles ou de végétaux. Les coprolithes permettent ainsi de reconstituer le régime alimentaire et les chaînes alimentaires d''écosystèmes disparus.');

-- Les légendes dépendent de l'article : l'image 4 existe aussi dans le carrousel du fossile 3.
INSERT INTO image_block (id_block, id_picture, image_caption) VALUES
    (2,  4,  'Le Microraptor de la Galerie de paléontologie de l''Université de la Garonne.'),
    (5,  11, 'Reconstitution de Microraptor en train de planer.'),
    (9,  10, 'Les grandes étapes de la fossilisation.'),
    (12, 9,  'Un oiseau de Messel, conservé dans des schistes bitumineux.'),
    (15, 8,  NULL);   -- légende facultative

COMMIT;


-- =============================================================================
--  7. VÉRIFICATIONS
-- =============================================================================
--  Ces requêtes ne modifient rien. Elles permettent de contrôler le jeu de données
--  après l'import.
-- -----------------------------------------------------------------------------

-- Nombre de lignes par table
SELECT 'continent' AS table_name, COUNT(*) AS nb FROM continent
UNION ALL SELECT 'country',                COUNT(*) FROM country
UNION ALL SELECT 'place',                  COUNT(*) FROM place
UNION ALL SELECT 'collection',             COUNT(*) FROM collection
UNION ALL SELECT 'fossil_type',            COUNT(*) FROM fossil_type
UNION ALL SELECT 'species',                COUNT(*) FROM species
UNION ALL SELECT 'geological_period',      COUNT(*) FROM geological_period
UNION ALL SELECT 'user',                   COUNT(*) FROM `user`
UNION ALL SELECT 'role',                   COUNT(*) FROM `role`
UNION ALL SELECT 'user_role',              COUNT(*) FROM user_role
UNION ALL SELECT 'palaeontologist',        COUNT(*) FROM palaeontologist
UNION ALL SELECT 'owner',                  COUNT(*) FROM owner
UNION ALL SELECT 'fossil',                 COUNT(*) FROM fossil
UNION ALL SELECT 'palaeontologist_fossil', COUNT(*) FROM palaeontologist_fossil
UNION ALL SELECT 'credit',                 COUNT(*) FROM credit
UNION ALL SELECT 'license',                COUNT(*) FROM license
UNION ALL SELECT 'picture',                COUNT(*) FROM picture
UNION ALL SELECT 'author',                 COUNT(*) FROM author
UNION ALL SELECT 'article',                COUNT(*) FROM article
UNION ALL SELECT 'author_article',         COUNT(*) FROM author_article
UNION ALL SELECT 'section',                COUNT(*) FROM section
UNION ALL SELECT 'block',                  COUNT(*) FROM block
UNION ALL SELECT 'paragraph_block',        COUNT(*) FROM paragraph_block
UNION ALL SELECT 'image_block',            COUNT(*) FROM image_block;

-- Cohérence de l'héritage des blocs : doit renvoyer 0 ligne.
-- Un bloc est en erreur s'il n'a pas de contenu dans la sous-table de son type,
-- ou s'il en a dans l'autre.
SELECT b.id_block, b.block_type
FROM block AS b
LEFT JOIN paragraph_block AS pb ON pb.id_block = b.id_block
LEFT JOIN image_block     AS ib ON ib.id_block = b.id_block
WHERE (b.block_type = 'paragraph' AND (pb.id_block IS NULL OR ib.id_block IS NOT NULL))
   OR (b.block_type = 'image'     AND (ib.id_block IS NULL OR pb.id_block IS NOT NULL));

-- Cohérence du continent : doit renvoyer 0 ligne.
-- Un fossile est en erreur si son continent diffère de celui du pays de son lieu d'extraction.
SELECT f.id_fossil, f.fossil_name
FROM fossil AS f
JOIN place   AS p ON p.id_place   = f.id_extraction_place
JOIN country AS c ON c.id_country = p.id_country
WHERE f.id_continent <> c.id_continent;

-- Rôles de chaque utilisateur (certains en cumulent plusieurs).
SELECT u.user_email,
       GROUP_CONCAT(r.role_name ORDER BY r.role_name SEPARATOR ', ') AS roles
FROM `user` AS u
JOIN user_role AS ur ON ur.id_user = u.id_user
JOIN `role`    AS r  ON r.id_role  = ur.id_role
GROUP BY u.id_user, u.user_email
ORDER BY u.id_user;
