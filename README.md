# 5CLOU - Projet de construction d'un flux de données en temps réels via Microsoft Fabric
## Auteur : Julien RENOULT - Béatrice BEAVOGUI
## Promo : SUPINFO Programme Grande École 5ème année
### *Spécialité : Ingénierie Data*
### *Date : 21/10/2026*
### Lien Projet : ...

# Introduction

Dans le cadre de ce projet, nous devions construire une architecture Fabric permettant de collecter les données en temps réels pour la météorologie
 et les mesures de radiations dans notr projet.

Pour réaliser ce projet, plusieurs technologies devront être utilisées :
- **Fabric** : outil cloud central pour la création de la pipeline de bout en bout
- **dbt** : pour le traitement analytique et nettoyage de nos données avec des processus ELT
- **Python/Jupyter/Spark** : pour l'exploration, le traitement et la visualisation de nos données
- **Power BI** : pour les rapports et tableaux de bords visuels et interactifs

La problématique de notre projet est de voir les conditions météorologiques en temps réels de ce qui se passe et la liaison avec les mesures radiologiques.


# Collecte des données en temps réels des stations

Pour pouvoir collecter les données météorologiques en temps réels, nous allons utiliser cette route d'API toutes les 6 minutes afin de capturer les dernières mesures météorologiques :

https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/stations/infrahoraire-6m

Header : apikey: ...

format : json

date : YYYY-mm-DDTHH:MM:00Z (attention multiple de 6 pour les minutes et décalage de deux heures par rapport à l'heure française, UTC format !)

Cette route sera appelée à travers soit d'un event ou d'un notebook python.

C'est une authentification par clé qui sera effectuée et renouvelé toutes les deux semaines (à automatiser !).

# Collecte des données de mesures de radiations 

Pour pouvoir observer les mesures de radiations relevés par les citoyens à travers tous le territoires français, nous pourrons nous baser sur deux types de sources de données :

- fichier CSV mise à jour quotidiennement : https://request.openradiation.net/download.html

- API OpenRadiation pour faire de la collecte des mesures de radiations collectives avec cette route : https://request.openradiation.net/measurements?apiKey=...&minStartTime=2026-10-21T15:00:00.0000&&maxStartTime=2026-10-21T19:05:59.000


Réflexion sur le streaming ou mise à jour quotidienne.

Choix : prendre la mise à jour quotidienne pour le moment avec openradiation en utilisant un autre processus. L'objectif est d'abord d'étudier le lien entre l'openradiation de ses mesures et l'historique des données météorologiques rencontrées pour ces stations.

# Pipeline Fabric à construire 

La pipeline Fabric sera à construire de cette façon :

RIT :

Météorologique => Eventstream => Eventhouse => Event Dashboard => Activator

Quotidienne :

OpenRadiation (Tar à dézipper pour capturer le fichier CSV) => Pipeline => lakehouse => DBT => semantic model => Power BI (Activator)

Liaison entre les deux sources et analyse approfondie :

Liaison entre les deux sources => lakehouse => DBT => semantic model => Power BI


Pour la construction de ces différentes parties de clux, ne pas oublier :
- de documenter les manipulations effectuées pour créer ces différentes parties de flux (faire des captures d'écran)
- les raisons du pourquoi, du comment et à quoi ça sert
- ce que ça permis d'apporter et réponds à quels contraintes d'existence