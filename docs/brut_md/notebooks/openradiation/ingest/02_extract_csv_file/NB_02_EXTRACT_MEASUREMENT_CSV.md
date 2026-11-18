# Descriptif rapide 
- Nom : NB_02_EXTRACT_MEASUREMENT_CSV
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets d'extraire depuis le fichier compressé les fichiers CSV

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../../README.md)
- [Notebooks](../../../README.md)

## Quoi ?

C'est un élément qui sert à l'extraction des **fichiers CSV de nos mesures de radiations**.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir les fichiers CSV résultants.


## Pourquoi ?

Il sert principalement comme **deuxième étape de notre flux pour les mesures de radiations**.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération du fichier compressé dans le lakehouse **openradiation_lakehouse**.

### Destination

Enregistrement des fichiers CSV dans le lakehouse **openradiation_lakehouse**.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/ingest/01_tar_file/NB_02_EXTRACT_MEASUREMENT_CSV.ipynb` | Notebook d'extraction des fichiers CSV depuis le fichier compressé |
| `notebooks/openradiation/ingest/01_tar_file/NB_02_EXTRACT_MEASUREMENT_CSV.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
