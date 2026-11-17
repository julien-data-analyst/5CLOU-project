# Pipeline de transformation quotidienne des données météorologiques

## 1. Descriptif 

- **Nom :** PL_Meteo_Transformation_journalière
- **Type :** Pipeline de données Microsoft Fabric
- **Espace de travail :** 5clou-project
- **Dossier :** Meteo
- **Fréquence d'exécution :** Quotidienne, à 9 h (heure de Paris)

Ce pipeline permet d'automatiser la préparation quotidienne
des observations météorologiques issues de Météo-France.

Il organise les traitements en trois étapes successives :
copie des données depuis Eventhouse vers la couche Bronze,
extraction des données JSON, puis nettoyage et préparation
de la couche Silver.

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../README.md)
- [Pipelines](../../README.md)

### Capture d'écran du pipeline

![Pipeline de transformation météo](01_vue_generale_pipeline_meteo.png)

*Figure 1 — Exécution réussie des trois activités du pipeline
de transformation quotidienne des données météorologiques.*

## 3. Pourquoi ?

Dans notre projet 5CLOU, les observations météorologiques
collectées depuis Météo-France sont d'abord stockées dans
Eventhouse. Cependant, ces données brutes ne sont pas
directement adaptées à toutes les analyses.

Nous avons donc créé ce pipeline pour automatiser leur
préparation et éviter de répéter manuellement les mêmes
traitements.

Il répond à quatre besoins principaux :

- **Automatiser les traitements :** exécuter quotidiennement
  les étapes de copie, de structuration et de nettoyage.

- **Organiser les données :** conserver les observations
  brutes dans la couche Bronze et les données nettoyées
  dans la couche Silver.

- **Améliorer la qualité des données :** extraire les
  informations utiles du JSON et convertir les températures
  en degrés Celsius.

- **Faciliter les analyses :** disposer de données
  structurées et préparées pour les traitements
  analytiques ultérieurs.

L'exécution quotidienne à 9 h (heure de Paris) permet
de mettre à jour automatiquement les données préparées,
sans lancer manuellement chaque notebook.

Ce pipeline constitue ainsi une étape de transformation
entre le stockage des observations dans Eventhouse
et leur exploitation analytique dans le Lakehouse.

## 4. Sources et destinations

Notre pipeline utilise les observations météorologiques
collectées depuis l'API Météo-France et stockées
dans Microsoft Fabric.

| Étape | Source | Destination |
|---|---|---|
| 1. Copie Bronze | Eventhouse `Eventhouse_meteo_France`, table `stream_meteo_france` | Lakehouse `dbo.raw_meteo_france` |
| 2. Parsing JSON | `dbo.raw_meteo_france` | `dbo.raw_meteo_france_parsing` |
| 3. Nettoyage Silver | `dbo.raw_meteo_france_parsing` | `dbo.silver_meteo_france` |

### Organisation des couches de données

- **Eventhouse :** reçoit et conserve les observations
  météorologiques issues du flux de collecte.

- **Bronze :** stocke une copie des observations brutes
  dans le Lakehouse.

- **Parsing :** extrait et structure les informations
  contenues dans les données JSON.

- **Silver :** contient les observations nettoyées
  et préparées pour les analyses.

Le pipeline permet ainsi de faire évoluer les données
depuis leur stockage initial vers une forme plus
facilement exploitable.

## 5. Comment ?

### 5.1. Copie des données Eventhouse vers Bronze

La première activité du pipeline est nommée
`01_COPIE_EVENTHOUSE_BRONZE`.

Nous avons utilisé l'activité **Copier les données**
de Microsoft Fabric pour transférer les observations
météorologiques depuis la table `stream_meteo_france`
de l'Eventhouse `Eventhouse_meteo_France` vers la table
`dbo.raw_meteo_france` du Lakehouse.

Cette étape permet de conserver les données brutes
dans la couche Bronze, avant les traitements de
structuration et de nettoyage.

#### Configuration de la source

La source de l'activité de copie est l'Eventhouse
`Eventhouse_meteo_France`.

Nous avons sélectionné le mode `Requête` et renseigné
`stream_meteo_france` pour accéder aux observations
météorologiques.

![Configuration de la source Eventhouse](02_source_eventhouse.png)

*Figure 2 — Configuration de la source Eventhouse
dans l'activité de copie du pipeline.*

#### Configuration de la destination

La destination de l'activité de copie est le Lakehouse
`Lakehouse_meteo_France`.

Nous avons sélectionné le dossier racine `Tables`
et la table `dbo.raw_meteo_france` pour enregistrer
les observations météorologiques brutes.

Cette table constitue la couche Bronze de notre
architecture de données.

![Configuration de la destination Lakehouse](03_destination_lakehouse_bronze.png)

*Figure 3 — Configuration de la destination Lakehouse
et de la table Bronze.*

#### Mappage des colonnes

L'onglet `Mappage` permet de définir la correspondance
entre les colonnes de la source Eventhouse et celles
de la table de destination dans le Lakehouse.

Les colonnes sources identifiées sont :

| Colonne source | Type source | Colonne destination | Type destination |
|---|---|---|---|
| source | string | source | string |
| observation_date | datetime | observation_date | timestamp |
| ingestion_date | datetime | ingestion_date | timestamp |
| data | dynamic | data | string 

![Mappage des colonnes](04_mappage_colonnes_bronze.png)


### 5.2. Extraction et structuration des données JSON

La deuxième activité du pipeline, `02_PARSING_JSON`,
utilise une activité de type **Bloc-notes** pour exécuter
le notebook `NB_02_Parsing_JSON` dans l'espace de travail
`5clou-project`.

Ce notebook lit les observations météorologiques de la
table Bronze `dbo.raw_meteo_france`, puis extrait et
structure les informations contenues dans la colonne
JSON `data`.

Les données obtenues sont enregistrées dans la table
`dbo.raw_meteo_france_parsing` du Lakehouse.

Cette étape prépare les données pour leur nettoyage
dans la couche Silver.

#### Configuration de l'activité

- **Nom :** `02_PARSING_JSON`
- **Type :** Bloc-notes
- **Espace de travail :** `5clou-project`
- **Notebook :** `NB_02_Parsing_JSON`
- **État :** Activé

![Configuration du notebook Parsing JSON](05_configuration_parsing_json.png)

*Figure 5 — Configuration de l'activité
`02_PARSING_JSON` dans Microsoft Fabric.*

### 5.3. Nettoyage et préparation des données Silver

La troisième activité du pipeline, `03_NETTOYAGE_SILVER`,
utilise une activité de type **Bloc-notes** pour exécuter
le notebook `NB_03_Nettoyage_Silver` dans l'espace de
travail `5clou-project`.

Ce notebook récupère les données structurées dans la table
`dbo.raw_meteo_france_parsing`, puis réalise les opérations
de nettoyage et de préparation nécessaires à leur
exploitation analytique.

Il effectue notamment la conversion des températures
de Kelvin en degrés Celsius afin de faciliter
leur interprétation.

Les données préparées sont enregistrées dans la table
`dbo.silver_meteo_france` du Lakehouse.

#### Configuration de l'activité

- **Nom :** `03_NETTOYAGE_SILVER`
- **Type :** Bloc-notes
- **Espace de travail :** `5clou-project`
- **Notebook :** `NB_03_Nettoyage_Silver`

![Configuration du notebook Nettoyage Silver](06_configuration_nettoyage_silver.png)


### 5.4. Planification et automatisation du pipeline

Afin d'automatiser la préparation des observations
météorologiques, nous avons configuré une planification
quotidienne dans Microsoft Fabric.

#### Configuration de la planification

- **Pipeline :** `PL_Meteo_Transformation_journalière`
- **Fréquence :** Tous les jours
- **Heure d'exécution :** 09:00
- **Fuseau horaire affiché :** UTC+01:00
- **État :** Actif

Cette planification permet de lancer automatiquement
les trois activités du pipeline : copie des observations
vers la couche Bronze, extraction des données JSON
et nettoyage des données dans la couche Silver.

Lors de notre vérification du 10 novembre 2026,
Microsoft Fabric indiquait une dernière exécution
planifiée réussie à 09:00.

Aucun destinataire de notification de défaillance
n'était renseigné dans la configuration affichée.

![Planification quotidienne du pipeline](07_planification_pipeline_meteo.png)

*Figure 7 — Planification quotidienne active du pipeline
météorologique dans Microsoft Fabric.*

## 6. Fichiers associés

Le pipeline `PL_Meteo_Transformation_journalière`
s'appuie sur plusieurs ressources Microsoft Fabric.

### Notebooks associés

| Notebook | Rôle |
|---|---|
| `NB_02_Parsing_JSON` | Extraction et structuration des observations météorologiques au format JSON |
| `NB_03_Nettoyage_Silver` | Nettoyage et préparation des données pour la couche Silver |

### Ressources de données associées

| Ressource | Nom | Rôle |
|---|---|---|
| Eventhouse | `Eventhouse_meteo_France` | Stockage des observations issues du flux météorologique |
| Table Eventhouse | `stream_meteo_france` | Source de l'activité de copie |
| Lakehouse | `Lakehouse_meteo_France` | Stockage des données utilisées par les traitements |
| Table Bronze | `dbo.raw_meteo_france` | Conservation des données brutes |
| Table intermédiaire | `dbo.raw_meteo_france_parsing` | Conservation des données JSON structurées |
| Table Silver | `dbo.silver_meteo_france` | Conservation des données nettoyées |

Les notebooks sont exécutés successivement par le pipeline,
après la copie des observations depuis Eventhouse vers
le Lakehouse.
