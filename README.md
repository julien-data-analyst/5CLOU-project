# 5CLOU - Projet de construction d'un flux de données en temps réels via Microsoft Fabric
## Auteur : Julien RENOULT - Béatrice BEAVOGUI
## Promo : SUPINFO Programme Grande École 5ème année
### *Spécialité : Ingénierie Data*
### *Date : 21/10/2026-18/11/2026*
### Lien Projet : https://github.com/julien-data-analyst/5CLOU-project

# Introduction

Dans le cadre de ce projet, nous devions construire une architecture Fabric permettant de collecter les données en temps réels pour la météorologie et les mesures de radiations dans notre projet.

Pour réaliser ce projet, plusieurs technologies devront être utilisées :
- **Fabric** : outil cloud central pour la création des flux de bout en bout
- **dbt** : pour le traitement analytique et nettoyage de nos données avec des processus ELT
- **Python/Jupyter/Spark** : pour l'exploration, le traitement et la visualisation de nos données
- **Power BI** : pour les rapports et tableaux de bords visuels et interactifs

La problématique de notre projet est de voir les conditions météorologiques en temps réels de ce qui se passe et la liaison avec les mesures radiologiques.

# Exploration des ressources Fabric créées

Pour explorer les différentes ressources créées dans le cadre de ce flux, vous pouvez les explorer dans ce sommaire permettant d'aller sur chaque markdown concerné (allez sur le dépôt GitHub public pour bénéficier de cela) :

- [Activateurs](./docs/brut_md/activator/README.md)
- [DBT Jobs](./docs/brut_md/dbt/README.md)
- [Eventstream](./docs/brut_md/eventstream/README.md)
- [Environment](./docs/brut_md/event_notebooks/README.md)
- [Eventhouse](./docs/brut_md/eventhouse/README.md)
- [Lakehouse](./docs/brut_md/lakehouse/README.md)
- [Notebooks](./docs/brut_md/notebooks/README.md)
- [Pipeline](./docs/brut_md/pipeline/README.md)
- [Power BI](./docs/brut_md/power_bi/README.md)
- [Dashboard RIT](./docs/brut_md/RIT_dashboard/README.md)
- [Modèle sémantique](./docs/brut_md/semantic_model/README.md)

# Collecte des données en temps réels des stations

Pour pouvoir collecter les données météorologiques en temps réels, nous allons utiliser cette route d'API toutes les 6 minutes afin de capturer les dernières mesures météorologiques :

```
https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/stations/infrahoraire-6m

Header : apikey: ...

format : json

date : YYYY-mm-DDTHH:MM:00Z (attention multiple de 6 pour les minutes et décalage de deux heures par rapport à l'heure française, format UTC)
```

Pour tester avec curl, définissez la variable de votre TOKEN avec la valeur du token concernée :

```bash

TOKEN = valeur-token

```

pour capturer la liste des stations disponibles :

```bash
curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPPaquetObs/v2/liste-stations' \
  -H 'accept: */*' \
  -H "apikey: Bearer "
```

pour capturer les observations météorologiques :

```bash
curl -X 'GET' 'https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/stations/infrahoraire-6m?date=2026-10-23T20:00:00Z&format=json' \   
    -H 'accept: */*'   -H "apikey: $TOKEN"
```

Si on ne veut pas capturer toutes les six minutes :

```bash

curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/stations/horaire?date=2026-10-23T20:00:00Z&format=json' \
  -H 'accept: */*' -H "apikey: $TOKEN"

```

Si je veux me concentrer sur une station :

```bash 
curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/infrahoraire-6m?id_station=01014002&format=json' \
  -H 'accept: */*' \
  -H "apikey: $TOKEN"
```

Si je veux me concentrer sur un département précis :

```bash 

curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPPaquetObs/v2/paquet/horaire?id-departement=76&format=json' \
  -H 'accept: */*' \
  -H "apikey: $TOKEN"
```

Cette route sera appelée à travers soit d'un event ou d'un notebook python.

C'est une authentification par clé qui sera effectuée et renouvelé toutes les deux semaines (à automatiser !).

# Collecte des données de mesures de radiations 

Pour pouvoir observer les mesures de radiations relevés par les citoyens à travers tous le territoires français, nous récupérons le fichier CSV mise à jour quotidiennement grâce à une [requête HTTP](https://request.openradiation.net/download.html).

Il nécessite pas d'authentification car c'est un fichier du domaine public et suffira juste de récupérer les nouvelles mesures tous les jours.

# Pipeline Fabric à construire 

## 1. Flux RIT — Temps réel

```mermaid
flowchart LR
    A["Source météorologique"] --> B["Eventstream"]
    B --> C["Eventhouse"]
    C --> D["Event Dashboard"]
    D --> E["Activator"]

    classDef source fill:#DCEEFF,stroke:#3182CE,color:#172554
    classDef ingestion fill:#EDE9FE,stroke:#8B5CF6,color:#312E81
    classDef storage fill:#D1FAE5,stroke:#10B981,color:#064E3B
    classDef action fill:#CCFBF1,stroke:#0D9488,color:#134E4A

    class A source
    class B,D ingestion
    class C storage
    class E action
```

**Objectif :** ingérer et visualiser les données météorologiques en temps réel, puis déclencher des actions à l'aide d'Activator.

## 2. Flux quotidien — OpenRadiation

```mermaid
flowchart LR
    A["OpenRadiation<br/>Archive TAR"] --> B["Décompression<br/>Extraction du CSV"]
    B --> C["Pipeline Fabric"]
    C --> D["Lakehouse"]
    D --> E["dbt"]
    E --> F["Semantic Model"]
    F --> G["Power BI"]

    classDef source fill:#FEF3C7,stroke:#D97706,color:#78350F
    classDef ingestion fill:#DCEEFF,stroke:#3182CE,color:#172554
    classDef storage fill:#D1FAE5,stroke:#10B981,color:#064E3B
    classDef transform fill:#EDE9FE,stroke:#8B5CF6,color:#312E81
    classDef visual fill:#CCFBF1,stroke:#0D9488,color:#134E4A

    class A,B source
    class C ingestion
    class D storage
    class E,F transform
    class G visual
```

**Objectif :** récupérer quotidiennement les données OpenRadiation, extraire le fichier CSV, charger les données dans le Lakehouse, les transformer avec dbt et les exposer dans Power BI.

*Remarque :* le lien entre Power BI et Activator est représenté comme un déclenchement d'actions à configurer selon le mécanisme retenu. Activator peut notamment réagir à des conditions détectées sur des données Power BI.

## 3. Flux combiné — Liaison des deux sources et analyse approfondie

```mermaid
flowchart TD
    subgraph RIT["Source temps réel"]
        A["Données météorologiques"]
        B["Eventstream"]
        C["Eventhouse"]
        A --> B --> C
    end

    subgraph DAILY["Source quotidienne"]
        D["OpenRadiation"]
        E["Pipeline Fabric"]
        F["Lakehouse - données OpenRadiation"]
        D --> E --> F
    end

    C --> G["Liaison des deux sources<br/>et enrichissement"]
    F --> G

    G --> H["Lakehouse<br/>Données unifiées"]
    H --> I["dbt<br/>Transformations communes"]
    I --> J["Semantic Model<br/>Modèle enrichi"]
    J --> K["Power BI<br/>Analyse approfondie"]

    classDef source fill:#DCEEFF,stroke:#3182CE,color:#172554
    classDef storage fill:#D1FAE5,stroke:#10B981,color:#064E3B
    classDef transform fill:#EDE9FE,stroke:#8B5CF6,color:#312E81
    classDef visual fill:#CCFBF1,stroke:#0D9488,color:#134E4A

    class A,B,D,E source
    class C,F,H storage
    class G,I,J transform
    class K visual
```

**Objectif :** rapprocher les données météorologiques et les mesures OpenRadiation pour construire une vision consolidée, faciliter les analyses croisées et alimenter des rapports Power BI enrichis.

La liaison doit s'appuyer sur des clés communes pertinentes, par exemple la date, l'heure ou la localisation, selon la granularité et la disponibilité des données.

## 4. Vue d'ensemble des flux

```mermaid
flowchart TB
    A["Météorologie"] --> B["Eventstream"] --> C["Eventhouse"]
    C --> D["Event Dashboard"] --> E["Activator"]

    F["OpenRadiation<br/>TAR vers CSV"] --> G["Pipeline"] --> H["Lakehouse"]
    H --> I["dbt"] --> J["Semantic Model"] --> K["Power BI"]

    C --> L["Liaison des sources"]
    H --> L
    L --> M["Lakehouse unifié"] --> N["dbt"] --> O["Semantic Model enrichi"] --> P["Power BI analytique"]
```

## 5. Légende des éléments

| Élément | Rôle |
|---|---|
| Eventstream | Ingestion et traitement des événements en temps réel |
| Eventhouse | Stockage et interrogation des données événementielles |
| Event Dashboard | Visualisation des événements et indicateurs en temps réel |
| Activator | Détection de conditions et déclenchement d'actions |
| Pipeline Fabric | Orchestration des étapes d'ingestion |
| Lakehouse | Stockage des données et préparation des traitements analytiques |
| dbt | Transformation, modélisation et tests des données |
| Semantic Model | Exposition des données selon un modèle métier |
| Power BI | Visualisation et analyse des données |

