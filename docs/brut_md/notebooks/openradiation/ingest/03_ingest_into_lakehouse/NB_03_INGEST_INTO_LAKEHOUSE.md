# Descriptif rapide 
- Nom : NB_03_INGEST_INTO_LAKEHOUSE
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets d'ingérer le fichier CSV de mesures dans le lakehouse

## Quoi ?

C'est un élément qui sert à l'ingestion de notre fichier de mesure dans le lakehouse avec une table brute des données.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir cette table brute existante dans le schéma *raw*.


## Pourquoi ?

Il sert principalement comme troisième étape de notre flux pour les mesures de radiations.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération du fichier CSV **measurements_without_enclosedObject.csv** dans le lakehouse.

### Destination

Ingestion dans la table brute **radiation_measures** dans le schéma *raw*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/ingest/03_ingest_into_lakehouse/NB_03_INGEST_INTO_LAKEHOUSE.ipynb` | Notebook d'ingestion du fichier de mesure dans une table brute |
| `notebooks/openradiation/ingest/03_ingest_into_lakehouse/NB_03_INGEST_INTO_LAKEHOUSE.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
