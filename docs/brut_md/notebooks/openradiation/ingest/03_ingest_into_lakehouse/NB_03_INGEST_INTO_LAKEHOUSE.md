# Descriptif rapide 
- Nom : NB_02_EXTRACT_MEASUREMENT_CSV
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets d'ingérer le fichier CSV de mesures dans le lakehouse

## Quoi ?

C'est un élément qui sert à l'ingestion de notre fichier de mesure dans le lakehouse avec une table brute des donénes.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir cette table brute existante dans le schéma *raw*.


## Pourquoi ?

Il sert principalement comme troisième étape de notre flux pour les mesures de radiations.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération d'un fichier compressé tar à partir de la requête ci-dessous :

https://request.openradiation.net/openradiation_dataset.tar.gz

### Destination

Qui va ensuite être enregistré avec le fichier compressé dans le lakehouse **openradiation_lakehouse**


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/ingest/03_ingest_into_lakehouse/NB_03_INGEST_INTO_LAKEHOUSE.ipynb` | Notebook d'ingestion du fichier de mesure dans une table brute |
| `notebooks/openradiation/ingest/03_ingest_into_lakehouse/NB_03_INGEST_INTO_LAKEHOUSE.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
