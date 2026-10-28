////////// Array of fossils generate by Claude.ai //////////

/* Used prompt :
In JavaScript, create an array of 100 objects.

fossil {
id: ,
name: ,
species: {name: , link: },
collection: ,
description: ,
is_exposed: ,
fossil_type: ,
dating: ,
continent: ,
extraction_site: ,
researchable: ,
owner: {name: , email: },
number_click: 
}

name :
unique name identifiyng the fossil

species :
can be null ; if it isn't, 'name' is the fossil's species name in French, 'link', can be null, is the French Wikipédia link of the species.

collection :
all_collections, vertebrate, invertebrate, insect, plant, other_fossils

description :
a text not too long describing the fossil in French.

is_exposed :
can be null, if it isn't then French museum name.

fossil_type :
like tooth, bone, print, footprint, etc. in French

dating :
a logical date dating the fossil in Ma.

continent :
africa, north_america, south_america, antertica, asia, europa, oceania

extraction_site :
remote city or village, region and country ; all in french or at least in latin alphabet.

researchable :
boolean, if true then fill 'owner' in French, else 'owner' is null.

number_click :
integer
*/

export const fossils_db = [
  {
    "id": 72,
    "published_date": "2026-06-03",
    "name": "Velociraptor mongoliensis #072",
    "species": {
      "name": "Velociraptor mongoliensis",
      "link": "https://fr.wikipedia.org/wiki/Velociraptor"
    },
    "collection": "vertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "os",
    "dating": 74.58,
    "continent": "asia",
    "extraction_site": "Chixculub, Yucatán, Mexique",
    "researchable": true,
    "owner": {
      "name": "Thomas Moreau",
      "email": "thomas.guérin@paleo-recherche.fr"
    },
    "number_click": 2730
  },
  {
    "id": 82,
    "published_date": "2026-05-21",
    "name": "Fossile fragmentaire #082",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée des Confluences",
    "fossil_type": "trace de pas",
    "dating": 3.64,
    "continent": "africa",
    "extraction_site": "Karoo, Cap-Nord, Afrique du Sud",
    "researchable": true,
    "owner": {
      "name": "Laura Blanchard",
      "email": "baptiste.muller@paleo-recherche.fr"
    },
    "number_click": 2691
  },
  {
    "id": 57,
    "published_date": "2026-04-27",
    "name": "Fossile indéterminé #057",
    "species": null,
    "collection": "plant",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "tronc pétrifié",
    "dating": 220.77,
    "continent": "south_america",
    "extraction_site": "Isle of Wight, Angleterre, Royaume-Uni",
    "researchable": false,
    "owner": null,
    "number_click": 4668
  },
  {
    "id": 71,
    "published_date": "2026-03-11",
    "name": "Otodus megalodon #071",
    "species": {
      "name": "Otodus megalodon",
      "link": "https://fr.wikipedia.org/wiki/Otodus_megalodon"
    },
    "collection": "vertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Muséum national d'Histoire naturelle de Paris",
    "fossil_type": "dent",
    "dating": 9.83,
    "continent": "asia",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Louise Renard",
      "email": "camille.robin@paleo-recherche.fr"
    },
    "number_click": 329
  },
  {
    "id": 19,
    "published_date": "2025-11-21",
    "name": "Plesiosaurus #019",
    "species": {
      "name": "Plesiosaurus",
      "link": "https://fr.wikipedia.org/wiki/Plesiosaurus"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "vertèbre",
    "dating": 188.44,
    "continent": "europa",
    "extraction_site": "Yixian, Liaoning, Chine",
    "researchable": true,
    "owner": {
      "name": "Marie Roussel",
      "email": "hugo.girard@paleo-recherche.fr"
    },
    "number_click": 4428
  },
  {
    "id": 91,
    "published_date": "2025-11-12",
    "name": "Sigillaria #091",
    "species": {
      "name": "Sigillaria",
      "link": "https://fr.wikipedia.org/wiki/Sigillaria"
    },
    "collection": "plant",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": null,
    "fossil_type": "tronc pétrifié",
    "dating": 314.93,
    "continent": "europa",
    "extraction_site": "Le Havre, Normandie, France",
    "researchable": true,
    "owner": {
      "name": "Marie Bonnet",
      "email": "mathieu.muller@paleo-recherche.fr"
    },
    "number_click": 2996
  },
  {
    "id": 38,
    "published_date": "2025-10-13",
    "name": "Spécimen non identifié #038",
    "species": null,
    "collection": "insect",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "insecte inclus dans l'ambre",
    "dating": 45.54,
    "continent": "europa",
    "extraction_site": "Dinosaur Provincial Park, Alberta, Canada",
    "researchable": false,
    "owner": null,
    "number_click": 1425
  },
  {
    "id": 20,
    "published_date": "2025-08-17",
    "name": "Tyrannosaurus rex #020",
    "species": {
      "name": "Tyrannosaurus rex",
      "link": "https://fr.wikipedia.org/wiki/Tyrannosaurus"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "dent",
    "dating": 66.33,
    "continent": "north_america",
    "extraction_site": "Talampaya, La Rioja, Argentine",
    "researchable": true,
    "owner": {
      "name": "Chloé Lefèvre",
      "email": "nicolas.muller@paleo-recherche.fr"
    },
    "number_click": 3198
  },
  {
    "id": 58,
    "published_date": "2025-06-26",
    "name": "Fossile fragmentaire #058",
    "species": null,
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "carapace",
    "dating": 79.77,
    "continent": "europa",
    "extraction_site": "Riversleigh, Queensland, Australie",
    "researchable": true,
    "owner": {
      "name": "Vincent Robin",
      "email": "amandine.robin@paleo-recherche.fr"
    },
    "number_click": 2263
  },
  {
    "id": 61,
    "published_date": "2025-02-24",
    "name": "Fossile fragmentaire #061",
    "species": null,
    "collection": "insect",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "carapace",
    "dating": 97.71,
    "continent": "asia",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Sophie Blanchard",
      "email": "antoine.aubert@paleo-recherche.fr"
    },
    "number_click": 1569
  },
  {
    "id": 46,
    "published_date": "2025-02-08",
    "name": "Fossile indéterminé #046",
    "species": null,
    "collection": "plant",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "tronc pétrifié",
    "dating": 217.84,
    "continent": "south_america",
    "extraction_site": "Ischigualasto, San Juan, Argentine",
    "researchable": true,
    "owner": {
      "name": "Hugo Moreau",
      "email": "claire.bonnet@paleo-recherche.fr"
    },
    "number_click": 1251
  },
  {
    "id": 42,
    "published_date": "2024-12-12",
    "name": "Trilobite #042",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "carapace",
    "dating": 473.81,
    "continent": "europa",
    "extraction_site": "Dinosaur Provincial Park, Alberta, Canada",
    "researchable": false,
    "owner": null,
    "number_click": 3273
  },
  {
    "id": 64,
    "published_date": "2024-11-29",
    "name": "Spécimen non identifié #064",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "œuf",
    "dating": 73.41,
    "continent": "asia",
    "extraction_site": "Flaming Cliffs, Gobi, Mongolie",
    "researchable": false,
    "owner": null,
    "number_click": 535
  },
  {
    "id": 26,
    "published_date": "2024-09-24",
    "name": "Ginkgo #026",
    "species": {
      "name": "Ginkgo",
      "link": "https://fr.wikipedia.org/wiki/Ginkgo_biloba"
    },
    "collection": "plant",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "feuille",
    "dating": 195.01,
    "continent": "europa",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": false,
    "owner": null,
    "number_click": 4333
  },
  {
    "id": 6,
    "published_date": "2024-09-05",
    "name": "Fossile fragmentaire #006",
    "species": null,
    "collection": "vertebrate",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "dent",
    "dating": 20.29,
    "continent": "asia",
    "extraction_site": "Angeac-Charente, Nouvelle-Aquitaine, France",
    "researchable": true,
    "owner": {
      "name": "Sophie Robin",
      "email": "marie.colin@paleo-recherche.fr"
    },
    "number_click": 4375
  },
  {
    "id": 77,
    "published_date": "2024-08-28",
    "name": "Fossile fragmentaire #077",
    "species": null,
    "collection": "other_fossils",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "inclusion dans l'ambre",
    "dating": 48.35,
    "continent": "europa",
    "extraction_site": "Vallée de la Somme, Hauts-de-France, France",
    "researchable": true,
    "owner": {
      "name": "Claire Muller",
      "email": "sophie.colin@paleo-recherche.fr"
    },
    "number_click": 1118
  },
  {
    "id": 89,
    "published_date": "2024-07-17",
    "name": "Fossile fragmentaire #089",
    "species": null,
    "collection": "insect",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": null,
    "fossil_type": "aile",
    "dating": 42.42,
    "continent": "europa",
    "extraction_site": "Neuquén, Patagonie, Argentine",
    "researchable": true,
    "owner": {
      "name": "Julien Faure",
      "email": "élise.lefèvre@paleo-recherche.fr"
    },
    "number_click": 1076
  },
  {
    "id": 86,
    "published_date": "2024-04-25",
    "name": "Fossile indéterminé #086",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "coprolithe",
    "dating": 67.31,
    "continent": "north_america",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Camille Roussel",
      "email": "étienne.aubert@paleo-recherche.fr"
    },
    "number_click": 3618
  },
  {
    "id": 76,
    "published_date": "2024-04-09",
    "name": "Spécimen non identifié #076",
    "species": null,
    "collection": "plant",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée des Confluences",
    "fossil_type": "feuille",
    "dating": 311.02,
    "continent": "north_america",
    "extraction_site": "Etoshapan, Kunene, Namibie",
    "researchable": true,
    "owner": {
      "name": "Antoine Roussel",
      "email": "antoine.bonnet@paleo-recherche.fr"
    },
    "number_click": 2390
  },
  {
    "id": 12,
    "published_date": "2024-01-09",
    "name": "Velociraptor mongoliensis #012",
    "species": {
      "name": "Velociraptor mongoliensis",
      "link": "https://fr.wikipedia.org/wiki/Velociraptor"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "griffe",
    "dating": 74.21,
    "continent": "asia",
    "extraction_site": "Île de Seymour, Péninsule Antarctique, Antarctique",
    "researchable": true,
    "owner": {
      "name": "Vincent Rousseau",
      "email": "hugo.perrot@paleo-recherche.fr"
    },
    "number_click": 4906
  },
  {
    "id": 100,
    "published_date": "2023-12-25",
    "name": "Fossile fragmentaire #100",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": null,
    "fossil_type": "inclusion dans l'ambre",
    "dating": 45.04,
    "continent": "europa",
    "extraction_site": "Liaoning, Liaoning, Chine",
    "researchable": false,
    "owner": null,
    "number_click": 2470
  },
  {
    "id": 52,
    "published_date": "2023-12-15",
    "name": "Triceratops horridus #052",
    "species": {
      "name": "Triceratops horridus",
      "link": "https://fr.wikipedia.org/wiki/Triceratops"
    },
    "collection": "vertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "corne",
    "dating": 69.36,
    "continent": "north_america",
    "extraction_site": "Karoo, Cap-Nord, Afrique du Sud",
    "researchable": true,
    "owner": {
      "name": "Antoine Renard",
      "email": "sophie.roussel@paleo-recherche.fr"
    },
    "number_click": 2099
  },
  {
    "id": 13,
    "published_date": "2023-10-12",
    "name": "Fossile indéterminé #013",
    "species": null,
    "collection": "insect",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": null,
    "fossil_type": "insecte inclus dans l'ambre",
    "dating": 41.12,
    "continent": "europa",
    "extraction_site": "Angeac-Charente, Nouvelle-Aquitaine, France",
    "researchable": true,
    "owner": {
      "name": "Julien Chevalier",
      "email": "louise.moreau@paleo-recherche.fr"
    },
    "number_click": 3981
  },
  {
    "id": 92,
    "published_date": "2023-07-07",
    "name": "Mammuthus primigenius #092",
    "species": {
      "name": "Mammuthus primigenius",
      "link": "https://fr.wikipedia.org/wiki/Mammouth_laineux"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "dent",
    "dating": 0.2,
    "continent": "europa",
    "extraction_site": "Zigong, Sichuan, Chine",
    "researchable": true,
    "owner": {
      "name": "Laura Renard",
      "email": "chloé.guérin@paleo-recherche.fr"
    },
    "number_click": 1915
  },
  {
    "id": 65,
    "published_date": "2023-04-13",
    "name": "Fossile indéterminé #065",
    "species": null,
    "collection": "invertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "squelette calcaire",
    "dating": 37.31,
    "continent": "oceania",
    "extraction_site": "Flaming Cliffs, Gobi, Mongolie",
    "researchable": true,
    "owner": {
      "name": "Louise Faure",
      "email": "marie.chevalier@paleo-recherche.fr"
    },
    "number_click": 3409
  },
  {
    "id": 32,
    "published_date": "2023-04-06",
    "name": "Triceratops horridus #032",
    "species": {
      "name": "Triceratops horridus",
      "link": "https://fr.wikipedia.org/wiki/Triceratops"
    },
    "collection": "vertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": null,
    "fossil_type": "corne",
    "dating": 69.13,
    "continent": "north_america",
    "extraction_site": "Etoshapan, Kunene, Namibie",
    "researchable": false,
    "owner": null,
    "number_click": 2032
  },
  {
    "id": 79,
    "published_date": "2023-02-01",
    "name": "Fossile indéterminé #079",
    "species": null,
    "collection": "other_fossils",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Natural History Museum de Londres",
    "fossil_type": "coprolithe",
    "dating": 67.69,
    "continent": "north_america",
    "extraction_site": "Cerin, Auvergne-Rhône-Alpes, France",
    "researchable": true,
    "owner": {
      "name": "Hugo Muller",
      "email": "élise.blanchard@paleo-recherche.fr"
    },
    "number_click": 1956
  },
  {
    "id": 62,
    "published_date": "2023-01-22",
    "name": "Dimetrodon grandis #062",
    "species": {
      "name": "Dimetrodon grandis",
      "link": "https://fr.wikipedia.org/wiki/Dimetrodon"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "dent",
    "dating": 282.61,
    "continent": "north_america",
    "extraction_site": "Mont Kirkpatrick, Terre Victoria, Antarctique",
    "researchable": true,
    "owner": {
      "name": "Antoine Fontaine",
      "email": "étienne.chevalier@paleo-recherche.fr"
    },
    "number_click": 1469
  },
  {
    "id": 85,
    "published_date": "2022-11-25",
    "name": "Fossile fragmentaire #085",
    "species": null,
    "collection": "plant",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "feuille",
    "dating": 303.4,
    "continent": "europa",
    "extraction_site": "Isle of Wight, Angleterre, Royaume-Uni",
    "researchable": false,
    "owner": null,
    "number_click": 1972
  },
  {
    "id": 74,
    "published_date": "2022-08-02",
    "name": "Spécimen non identifié #074",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": null,
    "fossil_type": "trace de pas",
    "dating": 3.63,
    "continent": "africa",
    "extraction_site": "Zigong, Sichuan, Chine",
    "researchable": true,
    "owner": {
      "name": "Manon Durand",
      "email": "hugo.roussel@paleo-recherche.fr"
    },
    "number_click": 1536
  },
  {
    "id": 31,
    "published_date": "2022-06-07",
    "name": "Smilodon fatalis #031",
    "species": {
      "name": "Smilodon fatalis",
      "link": "https://fr.wikipedia.org/wiki/Smilodon"
    },
    "collection": "vertebrate",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "dent",
    "dating": 2.43,
    "continent": "south_america",
    "extraction_site": "Karoo, Cap-Nord, Afrique du Sud",
    "researchable": false,
    "owner": null,
    "number_click": 3377
  },
  {
    "id": 48,
    "published_date": "2022-05-06",
    "name": "Fossile indéterminé #048",
    "species": null,
    "collection": "other_fossils",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "œuf",
    "dating": 72.99,
    "continent": "asia",
    "extraction_site": "Bolca, Vénétie, Italie",
    "researchable": true,
    "owner": {
      "name": "Hugo Colin",
      "email": "mathieu.barbier@paleo-recherche.fr"
    },
    "number_click": 3570
  },
  {
    "id": 83,
    "published_date": "2021-10-18",
    "name": "Plesiosaurus #083",
    "species": {
      "name": "Plesiosaurus",
      "link": "https://fr.wikipedia.org/wiki/Plesiosaurus"
    },
    "collection": "vertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "vertèbre",
    "dating": 192.54,
    "continent": "europa",
    "extraction_site": "Talampaya, La Rioja, Argentine",
    "researchable": true,
    "owner": {
      "name": "Marie Chevalier",
      "email": "étienne.chevalier@paleo-recherche.fr"
    },
    "number_click": 740
  },
  {
    "id": 11,
    "published_date": "2021-06-30",
    "name": "Archaeopteryx lithographica #011",
    "species": {
      "name": "Archaeopteryx lithographica",
      "link": "https://fr.wikipedia.org/wiki/Archaeopteryx"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": null,
    "fossil_type": "plume",
    "dating": 150.16,
    "continent": "europa",
    "extraction_site": "Hell Creek, Montana, États-Unis",
    "researchable": false,
    "owner": null,
    "number_click": 4100
  },
  {
    "id": 45,
    "published_date": "2021-05-09",
    "name": "Crinoïde #045",
    "species": {
      "name": "Crinoïde",
      "link": "https://fr.wikipedia.org/wiki/Crinoidea"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "tige",
    "dating": 344.62,
    "continent": "north_america",
    "extraction_site": "Vallée de la Somme, Hauts-de-France, France",
    "researchable": true,
    "owner": {
      "name": "Mathieu Robin",
      "email": "manon.barbier@paleo-recherche.fr"
    },
    "number_click": 1959
  },
  {
    "id": 81,
    "published_date": "2021-05-04",
    "name": "Spécimen non identifié #081",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée des Confluences",
    "fossil_type": "coprolithe",
    "dating": 67.51,
    "continent": "north_america",
    "extraction_site": "Le Havre, Normandie, France",
    "researchable": false,
    "owner": null,
    "number_click": 4308
  },
  {
    "id": 73,
    "published_date": "2021-02-08",
    "name": "Spécimen non identifié #073",
    "species": null,
    "collection": "insect",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "insecte inclus dans l'ambre",
    "dating": 43.3,
    "continent": "europa",
    "extraction_site": "Talampaya, La Rioja, Argentine",
    "researchable": false,
    "owner": null,
    "number_click": 300
  },
  {
    "id": 98,
    "published_date": "2021-01-11",
    "name": "Iguanodon bernissartensis #098",
    "species": {
      "name": "Iguanodon bernissartensis",
      "link": "https://fr.wikipedia.org/wiki/Iguanodon"
    },
    "collection": "vertebrate",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": null,
    "fossil_type": "os",
    "dating": 136.98,
    "continent": "europa",
    "extraction_site": "Zigong, Sichuan, Chine",
    "researchable": false,
    "owner": null,
    "number_click": 121
  },
  {
    "id": 60,
    "published_date": "2020-12-11",
    "name": "Ginkgo #060",
    "species": {
      "name": "Ginkgo",
      "link": "https://fr.wikipedia.org/wiki/Ginkgo_biloba"
    },
    "collection": "plant",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "feuille",
    "dating": 190.75,
    "continent": "europa",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": true,
    "owner": {
      "name": "Thomas Aubert",
      "email": "manon.guérin@paleo-recherche.fr"
    },
    "number_click": 4508
  },
  {
    "id": 44,
    "published_date": "2020-10-23",
    "name": "Fossile fragmentaire #044",
    "species": null,
    "collection": "other_fossils",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": null,
    "fossil_type": "trace de pas",
    "dating": 3.67,
    "continent": "africa",
    "extraction_site": "Riversleigh, Queensland, Australie",
    "researchable": false,
    "owner": null,
    "number_click": 4135
  },
  {
    "id": 28,
    "published_date": "2020-09-21",
    "name": "Dimetrodon grandis #028",
    "species": {
      "name": "Dimetrodon grandis",
      "link": "https://fr.wikipedia.org/wiki/Dimetrodon"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "dent",
    "dating": 280.94,
    "continent": "north_america",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Julien Moreau",
      "email": "simon.robin@paleo-recherche.fr"
    },
    "number_click": 29
  },
  {
    "id": 23,
    "published_date": "2020-09-08",
    "name": "Fossile fragmentaire #023",
    "species": null,
    "collection": "plant",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "feuille",
    "dating": 318.83,
    "continent": "europa",
    "extraction_site": "Ischigualasto, San Juan, Argentine",
    "researchable": true,
    "owner": {
      "name": "Baptiste Moreau",
      "email": "simon.renard@paleo-recherche.fr"
    },
    "number_click": 2591
  },
  {
    "id": 37,
    "published_date": "2020-08-12",
    "name": "Nautilus #037",
    "species": {
      "name": "Nautilus",
      "link": "https://fr.wikipedia.org/wiki/Nautilidae"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "coquille",
    "dating": 427.25,
    "continent": "asia",
    "extraction_site": "Le Havre, Normandie, France",
    "researchable": true,
    "owner": {
      "name": "Antoine Faure",
      "email": "manon.faure@paleo-recherche.fr"
    },
    "number_click": 3345
  },
  {
    "id": 78,
    "published_date": "2020-07-25",
    "name": "Trilobite #078",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "carapace",
    "dating": 348.17,
    "continent": "europa",
    "extraction_site": "Île de Seymour, Péninsule Antarctique, Antarctique",
    "researchable": false,
    "owner": null,
    "number_click": 2445
  },
  {
    "id": 96,
    "published_date": "2020-06-02",
    "name": "Ammonite #096",
    "species": {
      "name": "Ammonite",
      "link": "https://fr.wikipedia.org/wiki/Ammonoidea"
    },
    "collection": "invertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "coquille",
    "dating": 99.03,
    "continent": "africa",
    "extraction_site": "Zigong, Sichuan, Chine",
    "researchable": true,
    "owner": {
      "name": "Sophie Colin",
      "email": "camille.lefèvre@paleo-recherche.fr"
    },
    "number_click": 1995
  },
  {
    "id": 17,
    "published_date": "2020-05-18",
    "name": "Dimetrodon grandis #017",
    "species": {
      "name": "Dimetrodon grandis",
      "link": "https://fr.wikipedia.org/wiki/Dimetrodon"
    },
    "collection": "vertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "os",
    "dating": 260.93,
    "continent": "north_america",
    "extraction_site": "Vallée de la Somme, Hauts-de-France, France",
    "researchable": true,
    "owner": {
      "name": "Antoine Girard",
      "email": "simon.guérin@paleo-recherche.fr"
    },
    "number_click": 3367
  },
  {
    "id": 8,
    "published_date": "2020-02-21",
    "name": "Dimetrodon grandis #008",
    "species": {
      "name": "Dimetrodon grandis",
      "link": "https://fr.wikipedia.org/wiki/Dimetrodon"
    },
    "collection": "vertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": null,
    "fossil_type": "dent",
    "dating": 279.49,
    "continent": "north_america",
    "extraction_site": "Atacama, Antofagasta, Chili",
    "researchable": true,
    "owner": {
      "name": "Laura Bonnet",
      "email": "mathieu.aubert@paleo-recherche.fr"
    },
    "number_click": 2152
  },
  {
    "id": 25,
    "published_date": "2019-11-26",
    "name": "Fossile indéterminé #025",
    "species": null,
    "collection": "insect",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Musée des Confluences",
    "fossil_type": "insecte inclus dans l'ambre",
    "dating": 44.58,
    "continent": "europa",
    "extraction_site": "Messel, Hesse, Allemagne",
    "researchable": true,
    "owner": {
      "name": "Manon Robin",
      "email": "claire.guérin@paleo-recherche.fr"
    },
    "number_click": 3027
  },
  {
    "id": 30,
    "published_date": "2019-10-29",
    "name": "Trilobite #030",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "carapace",
    "dating": 461.96,
    "continent": "north_america",
    "extraction_site": "Karoo, Cap-Nord, Afrique du Sud",
    "researchable": true,
    "owner": {
      "name": "Étienne Guérin",
      "email": "julien.guérin@paleo-recherche.fr"
    },
    "number_click": 2044
  },
  {
    "id": 80,
    "published_date": "2019-10-24",
    "name": "Spécimen non identifié #080",
    "species": null,
    "collection": "invertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "carapace",
    "dating": 61.75,
    "continent": "europa",
    "extraction_site": "Vallée de la Somme, Hauts-de-France, France",
    "researchable": false,
    "owner": null,
    "number_click": 1246
  },
  {
    "id": 75,
    "published_date": "2019-09-10",
    "name": "Pterodactylus antiquus #075",
    "species": {
      "name": "Pterodactylus antiquus",
      "link": "https://fr.wikipedia.org/wiki/Pterodactylus"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "aile",
    "dating": 148.13,
    "continent": "europa",
    "extraction_site": "Flaming Cliffs, Gobi, Mongolie",
    "researchable": true,
    "owner": {
      "name": "Claire Faure",
      "email": "élise.barbier@paleo-recherche.fr"
    },
    "number_click": 236
  },
  {
    "id": 35,
    "published_date": "2019-08-23",
    "name": "Spécimen non identifié #035",
    "species": null,
    "collection": "insect",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "carapace",
    "dating": 103.77,
    "continent": "asia",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Laura Lefèvre",
      "email": "antoine.colin@paleo-recherche.fr"
    },
    "number_click": 2569
  },
  {
    "id": 5,
    "published_date": "2019-08-14",
    "name": "Basilosaurus isis #005",
    "species": {
      "name": "Basilosaurus isis",
      "link": "https://fr.wikipedia.org/wiki/Basilosaurus"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Muséum national d'Histoire naturelle de Paris",
    "fossil_type": "vertèbre",
    "dating": 37.46,
    "continent": "africa",
    "extraction_site": "El-Bahariya, Gizeh, Égypte",
    "researchable": false,
    "owner": null,
    "number_click": 653
  },
  {
    "id": 18,
    "published_date": "2019-07-10",
    "name": "Fossile indéterminé #018",
    "species": null,
    "collection": "other_fossils",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": null,
    "fossil_type": "trace de pas",
    "dating": 3.61,
    "continent": "africa",
    "extraction_site": "Le Havre, Normandie, France",
    "researchable": false,
    "owner": null,
    "number_click": 1558
  },
  {
    "id": 22,
    "published_date": "2019-06-29",
    "name": "Ammonite #022",
    "species": {
      "name": "Ammonite",
      "link": "https://fr.wikipedia.org/wiki/Ammonoidea"
    },
    "collection": "invertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "coquille",
    "dating": 148.96,
    "continent": "asia",
    "extraction_site": "Mont Kirkpatrick, Terre Victoria, Antarctique",
    "researchable": true,
    "owner": {
      "name": "Manon Moreau",
      "email": "nicolas.moreau@paleo-recherche.fr"
    },
    "number_click": 556
  },
  {
    "id": 70,
    "published_date": "2019-06-14",
    "name": "Ginkgo #070",
    "species": {
      "name": "Ginkgo",
      "link": "https://fr.wikipedia.org/wiki/Ginkgo_biloba"
    },
    "collection": "plant",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "feuille",
    "dating": 184.06,
    "continent": "asia",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": true,
    "owner": {
      "name": "Laura Perrot",
      "email": "hugo.barbier@paleo-recherche.fr"
    },
    "number_click": 658
  },
  {
    "id": 33,
    "published_date": "2019-05-01",
    "name": "Fossile indéterminé #033",
    "species": null,
    "collection": "plant",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "tronc pétrifié",
    "dating": 209.56,
    "continent": "south_america",
    "extraction_site": "Liaoning, Liaoning, Chine",
    "researchable": true,
    "owner": {
      "name": "Élise Guérin",
      "email": "étienne.chevalier@paleo-recherche.fr"
    },
    "number_click": 1582
  },
  {
    "id": 3,
    "published_date": "2019-04-08",
    "name": "Tyrannosaurus rex #003",
    "species": {
      "name": "Tyrannosaurus rex",
      "link": "https://fr.wikipedia.org/wiki/Tyrannosaurus"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "mâchoire",
    "dating": 66.68,
    "continent": "north_america",
    "extraction_site": "Karoo, Cap-Nord, Afrique du Sud",
    "researchable": false,
    "owner": null,
    "number_click": 837
  },
  {
    "id": 34,
    "published_date": "2019-03-10",
    "name": "Spécimen non identifié #034",
    "species": null,
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Natural History Museum de Londres",
    "fossil_type": "squelette calcaire",
    "dating": 45.93,
    "continent": "oceania",
    "extraction_site": "Yixian, Liaoning, Chine",
    "researchable": false,
    "owner": null,
    "number_click": 4392
  },
  {
    "id": 87,
    "published_date": "2019-03-05",
    "name": "Spécimen non identifié #087",
    "species": null,
    "collection": "insect",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "aile",
    "dating": 43.81,
    "continent": "europa",
    "extraction_site": "Naracoorte, Australie-Méridionale, Australie",
    "researchable": true,
    "owner": {
      "name": "Chloé Barbier",
      "email": "antoine.chevalier@paleo-recherche.fr"
    },
    "number_click": 2940
  },
  {
    "id": 16,
    "published_date": "2019-01-12",
    "name": "Fossile indéterminé #016",
    "species": null,
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "dent",
    "dating": 8.9,
    "continent": "africa",
    "extraction_site": "Flaming Cliffs, Gobi, Mongolie",
    "researchable": true,
    "owner": {
      "name": "Julien Blanchard",
      "email": "marie.perrot@paleo-recherche.fr"
    },
    "number_click": 3976
  },
  {
    "id": 14,
    "published_date": "2018-07-12",
    "name": "Trilobite #014",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "carapace",
    "dating": 421.74,
    "continent": "north_america",
    "extraction_site": "Laetoli, Arusha, Tanzanie",
    "researchable": true,
    "owner": {
      "name": "Baptiste Henry",
      "email": "sophie.aubert@paleo-recherche.fr"
    },
    "number_click": 1647
  },
  {
    "id": 10,
    "published_date": "2018-06-20",
    "name": "Trilobite #010",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "carapace",
    "dating": 407.05,
    "continent": "europa",
    "extraction_site": "Naracoorte, Australie-Méridionale, Australie",
    "researchable": true,
    "owner": {
      "name": "Hugo Durand",
      "email": "antoine.aubert@paleo-recherche.fr"
    },
    "number_click": 2786
  },
  {
    "id": 59,
    "published_date": "2018-06-18",
    "name": "Basilosaurus isis #059",
    "species": {
      "name": "Basilosaurus isis",
      "link": "https://fr.wikipedia.org/wiki/Basilosaurus"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "os",
    "dating": 34.51,
    "continent": "africa",
    "extraction_site": "Etoshapan, Kunene, Namibie",
    "researchable": true,
    "owner": {
      "name": "Mathieu Barbier",
      "email": "thomas.roussel@paleo-recherche.fr"
    },
    "number_click": 762
  },
  {
    "id": 29,
    "published_date": "2018-04-28",
    "name": "Fossile fragmentaire #029",
    "species": null,
    "collection": "insect",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "carapace",
    "dating": 96.62,
    "continent": "asia",
    "extraction_site": "Green River, Wyoming, États-Unis",
    "researchable": false,
    "owner": null,
    "number_click": 916
  },
  {
    "id": 53,
    "published_date": "2018-02-28",
    "name": "Nautilus #053",
    "species": {
      "name": "Nautilus",
      "link": "https://fr.wikipedia.org/wiki/Nautilidae"
    },
    "collection": "invertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "coquille",
    "dating": 351.12,
    "continent": "asia",
    "extraction_site": "Laetoli, Arusha, Tanzanie",
    "researchable": true,
    "owner": {
      "name": "Camille Faure",
      "email": "louise.muller@paleo-recherche.fr"
    },
    "number_click": 1624
  },
  {
    "id": 27,
    "published_date": "2018-02-08",
    "name": "Tyrannosaurus rex #027",
    "species": {
      "name": "Tyrannosaurus rex",
      "link": "https://fr.wikipedia.org/wiki/Tyrannosaurus"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "os",
    "dating": 67.88,
    "continent": "north_america",
    "extraction_site": "Neuquén, Patagonie, Argentine",
    "researchable": true,
    "owner": {
      "name": "Antoine Aubert",
      "email": "claire.robin@paleo-recherche.fr"
    },
    "number_click": 4954
  },
  {
    "id": 63,
    "published_date": "2018-01-20",
    "name": "Meganeura monyi #063",
    "species": {
      "name": "Meganeura monyi",
      "link": "https://fr.wikipedia.org/wiki/Meganeura"
    },
    "collection": "insect",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "aile",
    "dating": 299.27,
    "continent": "europa",
    "extraction_site": "Flaming Cliffs, Gobi, Mongolie",
    "researchable": true,
    "owner": {
      "name": "Claire Barbier",
      "email": "antoine.durand@paleo-recherche.fr"
    },
    "number_click": 2329
  },
  {
    "id": 7,
    "published_date": "2017-12-07",
    "name": "Spécimen non identifié #007",
    "species": null,
    "collection": "plant",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": null,
    "fossil_type": "feuille",
    "dating": 307.59,
    "continent": "north_america",
    "extraction_site": "Cleveland-Lloyd, Utah, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Julien Chevalier",
      "email": "julien.blanchard@paleo-recherche.fr"
    },
    "number_click": 542
  },
  {
    "id": 93,
    "published_date": "2017-11-24",
    "name": "Fossile indéterminé #093",
    "species": null,
    "collection": "other_fossils",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": null,
    "fossil_type": "œuf",
    "dating": 79.15,
    "continent": "asia",
    "extraction_site": "Cleveland-Lloyd, Utah, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Élise Faure",
      "email": "simon.girard@paleo-recherche.fr"
    },
    "number_click": 304
  },
  {
    "id": 51,
    "published_date": "2017-10-25",
    "name": "Fossile fragmentaire #051",
    "species": null,
    "collection": "invertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "carapace",
    "dating": 70.09,
    "continent": "europa",
    "extraction_site": "Isle of Wight, Angleterre, Royaume-Uni",
    "researchable": true,
    "owner": {
      "name": "Hugo Lefèvre",
      "email": "vincent.chevalier@paleo-recherche.fr"
    },
    "number_click": 329
  },
  {
    "id": 24,
    "published_date": "2017-09-28",
    "name": "Sigillaria #024",
    "species": {
      "name": "Sigillaria",
      "link": "https://fr.wikipedia.org/wiki/Sigillaria"
    },
    "collection": "plant",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "tronc pétrifié",
    "dating": 304.77,
    "continent": "europa",
    "extraction_site": "Atacama, Antofagasta, Chili",
    "researchable": false,
    "owner": null,
    "number_click": 3745
  },
  {
    "id": 2,
    "published_date": "2017-09-09",
    "name": "Mammuthus primigenius #002",
    "species": {
      "name": "Mammuthus primigenius",
      "link": "https://fr.wikipedia.org/wiki/Mammouth_laineux"
    },
    "collection": "vertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "défense",
    "dating": 0.36,
    "continent": "europa",
    "extraction_site": "Solnhofen, Bavière, Allemagne",
    "researchable": true,
    "owner": {
      "name": "Hugo Henry",
      "email": "mathieu.roussel@paleo-recherche.fr"
    },
    "number_click": 2278
  },
  {
    "id": 15,
    "published_date": "2017-09-06",
    "name": "Meganeura monyi #015",
    "species": {
      "name": "Meganeura monyi",
      "link": "https://fr.wikipedia.org/wiki/Meganeura"
    },
    "collection": "insect",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "aile",
    "dating": 299.44,
    "continent": "europa",
    "extraction_site": "Mont Kirkpatrick, Terre Victoria, Antarctique",
    "researchable": true,
    "owner": {
      "name": "Mathieu Moreau",
      "email": "amandine.durand@paleo-recherche.fr"
    },
    "number_click": 4537
  },
  {
    "id": 99,
    "published_date": "2017-08-18",
    "name": "Spécimen non identifié #099",
    "species": null,
    "collection": "insect",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Muséum national d'Histoire naturelle de Paris",
    "fossil_type": "aile",
    "dating": 30.32,
    "continent": "europa",
    "extraction_site": "Rancho La Brea, Californie, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Simon Perrot",
      "email": "antoine.moreau@paleo-recherche.fr"
    },
    "number_click": 2965
  },
  {
    "id": 39,
    "published_date": "2017-07-29",
    "name": "Meganeura monyi #039",
    "species": {
      "name": "Meganeura monyi",
      "link": "https://fr.wikipedia.org/wiki/Meganeura"
    },
    "collection": "insect",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "aile",
    "dating": 299.3,
    "continent": "europa",
    "extraction_site": "Bernissart, Hainaut, Belgique",
    "researchable": false,
    "owner": null,
    "number_click": 2639
  },
  {
    "id": 50,
    "published_date": "2017-06-10",
    "name": "Triceratops horridus #050",
    "species": {
      "name": "Triceratops horridus",
      "link": "https://fr.wikipedia.org/wiki/Triceratops"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "corne",
    "dating": 66.54,
    "continent": "north_america",
    "extraction_site": "Naracoorte, Australie-Méridionale, Australie",
    "researchable": true,
    "owner": {
      "name": "Chloé Blanchard",
      "email": "sophie.roussel@paleo-recherche.fr"
    },
    "number_click": 2764
  },
  {
    "id": 84,
    "published_date": "2017-06-07",
    "name": "Crinoïde #084",
    "species": {
      "name": "Crinoïde",
      "link": "https://fr.wikipedia.org/wiki/Crinoidea"
    },
    "collection": "invertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Muséum national d'Histoire naturelle de Paris",
    "fossil_type": "tige",
    "dating": 326.62,
    "continent": "north_america",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": true,
    "owner": {
      "name": "Julien Faure",
      "email": "vincent.guérin@paleo-recherche.fr"
    },
    "number_click": 1192
  },
  {
    "id": 54,
    "published_date": "2017-06-05",
    "name": "Trilobite #054",
    "species": {
      "name": "Trilobite",
      "link": "https://fr.wikipedia.org/wiki/Trilobita"
    },
    "collection": "invertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": null,
    "fossil_type": "carapace",
    "dating": 430.35,
    "continent": "north_america",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": false,
    "owner": null,
    "number_click": 4636
  },
  {
    "id": 36,
    "published_date": "2017-05-19",
    "name": "Crinoïde #036",
    "species": {
      "name": "Crinoïde",
      "link": "https://fr.wikipedia.org/wiki/Crinoidea"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "tige",
    "dating": 353.97,
    "continent": "north_america",
    "extraction_site": "Dinosaur Provincial Park, Alberta, Canada",
    "researchable": true,
    "owner": {
      "name": "Simon Durand",
      "email": "manon.aubert@paleo-recherche.fr"
    },
    "number_click": 1614
  },
  {
    "id": 9,
    "published_date": "2017-03-28",
    "name": "Crinoïde #009",
    "species": {
      "name": "Crinoïde",
      "link": "https://fr.wikipedia.org/wiki/Crinoidea"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée cantonal de géologie de Lausanne",
    "fossil_type": "tige",
    "dating": 313.16,
    "continent": "north_america",
    "extraction_site": "Neuquén, Patagonie, Argentine",
    "researchable": true,
    "owner": {
      "name": "Julien Girard",
      "email": "claire.rousseau@paleo-recherche.fr"
    },
    "number_click": 3458
  },
  {
    "id": 90,
    "published_date": "2017-03-24",
    "name": "Mammuthus primigenius #090",
    "species": {
      "name": "Mammuthus primigenius",
      "link": "https://fr.wikipedia.org/wiki/Mammouth_laineux"
    },
    "collection": "vertebrate",
    "description": "Élément remarquable retrouvé dans une strate sédimentaire datée avec précision. Ce fossile constitue une référence pour l'étude de la biodiversité ancienne.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "dent",
    "dating": 0.53,
    "continent": "north_america",
    "extraction_site": "Chixculub, Yucatán, Mexique",
    "researchable": true,
    "owner": {
      "name": "Hugo Guérin",
      "email": "manon.perrot@paleo-recherche.fr"
    },
    "number_click": 1347
  },
  {
    "id": 49,
    "published_date": "2017-01-22",
    "name": "Fossile indéterminé #049",
    "species": null,
    "collection": "other_fossils",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": null,
    "fossil_type": "coprolithe",
    "dating": 66.68,
    "continent": "north_america",
    "extraction_site": "Atacama, Antofagasta, Chili",
    "researchable": true,
    "owner": {
      "name": "Élise Bonnet",
      "email": "baptiste.aubert@paleo-recherche.fr"
    },
    "number_click": 4848
  },
  {
    "id": 4,
    "published_date": "2016-12-07",
    "name": "Mammuthus primigenius #004",
    "species": {
      "name": "Mammuthus primigenius",
      "link": "https://fr.wikipedia.org/wiki/Mammouth_laineux"
    },
    "collection": "vertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "dent",
    "dating": 0.26,
    "continent": "europa",
    "extraction_site": "Cerin, Auvergne-Rhône-Alpes, France",
    "researchable": true,
    "owner": {
      "name": "Julien Roussel",
      "email": "hugo.girard@paleo-recherche.fr"
    },
    "number_click": 645
  },
  {
    "id": 56,
    "published_date": "2016-09-01",
    "name": "Nautilus #056",
    "species": {
      "name": "Nautilus",
      "link": "https://fr.wikipedia.org/wiki/Nautilidae"
    },
    "collection": "invertebrate",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": null,
    "fossil_type": "coquille",
    "dating": 198.79,
    "continent": "asia",
    "extraction_site": "Mont Kirkpatrick, Terre Victoria, Antarctique",
    "researchable": true,
    "owner": {
      "name": "Hugo Barbier",
      "email": "élise.henry@paleo-recherche.fr"
    },
    "number_click": 4853
  },
  {
    "id": 67,
    "published_date": "2016-08-23",
    "name": "Smilodon fatalis #067",
    "species": {
      "name": "Smilodon fatalis",
      "link": "https://fr.wikipedia.org/wiki/Smilodon"
    },
    "collection": "vertebrate",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "crâne",
    "dating": 0.67,
    "continent": "north_america",
    "extraction_site": "Isle of Wight, Angleterre, Royaume-Uni",
    "researchable": true,
    "owner": {
      "name": "Hugo Moreau",
      "email": "nicolas.durand@paleo-recherche.fr"
    },
    "number_click": 3690
  },
  {
    "id": 69,
    "published_date": "2016-08-16",
    "name": "Sigillaria #069",
    "species": {
      "name": "Sigillaria",
      "link": "https://fr.wikipedia.org/wiki/Sigillaria"
    },
    "collection": "plant",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": null,
    "fossil_type": "tronc pétrifié",
    "dating": 302.3,
    "continent": "europa",
    "extraction_site": "Cleveland-Lloyd, Utah, États-Unis",
    "researchable": true,
    "owner": {
      "name": "Laura Bonnet",
      "email": "marie.lefèvre@paleo-recherche.fr"
    },
    "number_click": 2519
  },
  {
    "id": 43,
    "published_date": "2016-08-08",
    "name": "Fossile fragmentaire #043",
    "species": null,
    "collection": "plant",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": null,
    "fossil_type": "feuille",
    "dating": 317.85,
    "continent": "europa",
    "extraction_site": "Messel, Hesse, Allemagne",
    "researchable": true,
    "owner": {
      "name": "Nicolas Perrot",
      "email": "élise.lefèvre@paleo-recherche.fr"
    },
    "number_click": 994
  },
  {
    "id": 94,
    "published_date": "2016-07-06",
    "name": "Meganeura monyi #094",
    "species": {
      "name": "Meganeura monyi",
      "link": "https://fr.wikipedia.org/wiki/Meganeura"
    },
    "collection": "insect",
    "description": "Découverte notable lors de fouilles paléontologiques, cette pièce illustre les conditions environnementales de l'époque de dépôt.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "aile",
    "dating": 299.1,
    "continent": "europa",
    "extraction_site": "Neuquén, Patagonie, Argentine",
    "researchable": true,
    "owner": {
      "name": "Hugo Henry",
      "email": "louise.bonnet@paleo-recherche.fr"
    },
    "number_click": 811
  },
  {
    "id": 21,
    "published_date": "2016-06-30",
    "name": "Sigillaria #021",
    "species": {
      "name": "Sigillaria",
      "link": "https://fr.wikipedia.org/wiki/Sigillaria"
    },
    "collection": "plant",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Muséum de Toulouse",
    "fossil_type": "tronc pétrifié",
    "dating": 308.46,
    "continent": "europa",
    "extraction_site": "Talampaya, La Rioja, Argentine",
    "researchable": true,
    "owner": {
      "name": "Sophie Lefèvre",
      "email": "louise.aubert@paleo-recherche.fr"
    },
    "number_click": 2569
  },
  {
    "id": 88,
    "published_date": "2016-05-13",
    "name": "Ginkgo #088",
    "species": {
      "name": "Ginkgo",
      "link": "https://fr.wikipedia.org/wiki/Ginkgo_biloba"
    },
    "collection": "plant",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "American Museum of Natural History",
    "fossil_type": "feuille",
    "dating": 199.34,
    "continent": "asia",
    "extraction_site": "Atacama, Antofagasta, Chili",
    "researchable": true,
    "owner": {
      "name": "Julien Colin",
      "email": "thomas.faure@paleo-recherche.fr"
    },
    "number_click": 4973
  },
  {
    "id": 97,
    "published_date": "2016-05-06",
    "name": "Spinosaurus aegyptiacus #097",
    "species": {
      "name": "Spinosaurus aegyptiacus",
      "link": "https://fr.wikipedia.org/wiki/Spinosaurus"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "dent",
    "dating": 99.15,
    "continent": "africa",
    "extraction_site": "Bernissart, Hainaut, Belgique",
    "researchable": true,
    "owner": {
      "name": "Mathieu Blanchard",
      "email": "claire.colin@paleo-recherche.fr"
    },
    "number_click": 2271
  },
  {
    "id": 68,
    "published_date": "2016-04-03",
    "name": "Fossile indéterminé #068",
    "species": null,
    "collection": "other_fossils",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": null,
    "fossil_type": "œuf",
    "dating": 72.31,
    "continent": "asia",
    "extraction_site": "Baltique, Kaliningrad, Russie",
    "researchable": false,
    "owner": null,
    "number_click": 1912
  },
  {
    "id": 66,
    "published_date": "2015-11-03",
    "name": "Spécimen non identifié #066",
    "species": null,
    "collection": "vertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Musée d'Histoire naturelle de Berlin",
    "fossil_type": "dent",
    "dating": 54.97,
    "continent": "asia",
    "extraction_site": "Charmouth, Dorset, Royaume-Uni",
    "researchable": false,
    "owner": null,
    "number_click": 493
  },
  {
    "id": 47,
    "published_date": "2015-07-06",
    "name": "Dimetrodon grandis #047",
    "species": {
      "name": "Dimetrodon grandis",
      "link": "https://fr.wikipedia.org/wiki/Dimetrodon"
    },
    "collection": "vertebrate",
    "description": "Spécimen présentant des traces de minéralisation typiques de la fossilisation dans un contexte sédimentaire calme.",
    "is_exposed": "Field Museum de Chicago",
    "fossil_type": "os",
    "dating": 268.34,
    "continent": "north_america",
    "extraction_site": "Naracoorte, Australie-Méridionale, Australie",
    "researchable": true,
    "owner": {
      "name": "Simon Muller",
      "email": "louise.durand@paleo-recherche.fr"
    },
    "number_click": 3116
  },
  {
    "id": 40,
    "published_date": "2015-06-07",
    "name": "Fossile fragmentaire #040",
    "species": null,
    "collection": "other_fossils",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": "Musée royal de l'Afrique centrale",
    "fossil_type": "trace de pas",
    "dating": 3.67,
    "continent": "africa",
    "extraction_site": "Île de Seymour, Péninsule Antarctique, Antarctique",
    "researchable": false,
    "owner": null,
    "number_click": 694
  },
  {
    "id": 41,
    "published_date": "2015-05-20",
    "name": "Ginkgo #041",
    "species": {
      "name": "Ginkgo",
      "link": "https://fr.wikipedia.org/wiki/Ginkgo_biloba"
    },
    "collection": "plant",
    "description": "Fragment fossilisé témoignant de la faune ou de la flore ayant peuplé la région à cette époque. La pièce se distingue par son excellent état de conservation.",
    "is_exposed": null,
    "fossil_type": "feuille",
    "dating": 194.55,
    "continent": "asia",
    "extraction_site": "Ischigualasto, San Juan, Argentine",
    "researchable": true,
    "owner": {
      "name": "Sophie Bonnet",
      "email": "camille.lefèvre@paleo-recherche.fr"
    },
    "number_click": 3892
  },
  {
    "id": 55,
    "published_date": "2015-04-13",
    "name": "Otodus megalodon #055",
    "species": {
      "name": "Otodus megalodon",
      "link": "https://fr.wikipedia.org/wiki/Otodus_megalodon"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": "Musée des Confluences",
    "fossil_type": "dent",
    "dating": 11.43,
    "continent": "asia",
    "extraction_site": "Angeac-Charente, Nouvelle-Aquitaine, France",
    "researchable": true,
    "owner": {
      "name": "Amandine Durand",
      "email": "simon.barbier@paleo-recherche.fr"
    },
    "number_click": 3551
  },
  {
    "id": 1,
    "published_date": "2015-01-02",
    "name": "Archaeopteryx lithographica #001",
    "species": {
      "name": "Archaeopteryx lithographica",
      "link": "https://fr.wikipedia.org/wiki/Archaeopteryx"
    },
    "collection": "vertebrate",
    "description": "Spécimen bien conservé mettant en évidence la structure caractéristique de l'espèce. Découvert lors d'une campagne de fouilles, ce fossile présente une minéralisation homogène.",
    "is_exposed": null,
    "fossil_type": "os",
    "dating": 150.24,
    "continent": "europa",
    "extraction_site": "Neuquén, Patagonie, Argentine",
    "researchable": true,
    "owner": {
      "name": "Hugo Moreau",
      "email": "louise.henry@paleo-recherche.fr"
    },
    "number_click": 244
  },
  {
    "id": 95,
    "published_date": "2015-01-01",
    "name": "Fossile fragmentaire #095",
    "species": null,
    "collection": "other_fossils",
    "description": "Pièce rare, étudiée pour mieux comprendre l'évolution du groupe auquel appartient ce fossile.",
    "is_exposed": "Musée des Dinosaures d'Espéraza",
    "fossil_type": "coprolithe",
    "dating": 65.16,
    "continent": "north_america",
    "extraction_site": "Angeac-Charente, Nouvelle-Aquitaine, France",
    "researchable": true,
    "owner": {
      "name": "Mathieu Guérin",
      "email": "antoine.guérin@paleo-recherche.fr"
    },
    "number_click": 2938
  }
];