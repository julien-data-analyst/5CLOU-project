# Descriptif rapide 
- Nom : NB_01_INGEST_TAR_FILE
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets d'ingérer le fichier compressé dans le lakehouse

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../../README.md)
- [Notebooks](../../../README.md)

## Quoi ?

C'est un élément qui sert à la récupération du fichier compressé tar grâce à l'appel d'une requête HTTP.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir le fichier compressé résultant.


## Pourquoi ?

Il sert principalement comme **première étape de notre flux pour les mesures de radiations**.

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
| `notebooks/openradiation/ingest/01_tar_file/NB_01_INGEST_TAR_FILE.ipynb` | Notebook d'ingestion du fichier compressé |
| `notebooks/openradiation/ingest/01_tar_file/NB_01_INGEST_TAR_FILE.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
