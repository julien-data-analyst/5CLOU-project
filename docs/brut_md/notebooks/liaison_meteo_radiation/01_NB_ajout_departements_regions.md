# Descriptif rapide 
- Nom : 01_NB_ajout_departements_regions
- Type : Notebook python pyspark
- Date de modification : 16/11/2026
- Description : un notebook qui filtre et ajoute des informations supplémentaires aux mesures météorologiques/radiations se déroulant en France

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../README.md)
- [Notebooks](../README.md)

## Quoi ?

C'est un élément de notebook **qui sert à l'ajout des informations géographiques (régions, départements, communes)** à nos mesures et d'enlever ceux qui n'ont pas été faits en France.


## Pourquoi ?

Il sert principalement comme **première étape de notre flux pour la liaison** entre les mesures de radiations et de météo.

Ces données sont ingérées dans notre lakehouse **meteo_radiation_lakehouse** (via un raccourci sur les deux lakehouses) qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Les données seront récupérées dans les lakehouses **openradiation_lakehouse** et **Lakehouse_meteo_France**.

### Destination

Les tables seront enregistrées dans les lakehouses respectifs nommées **french_ground_measures** dans le schéma *silver* d'**openradiation_lakehouse** et **silver_french_measures** dans le **Lakehouse_meteo_France**.

## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/liaison_meteo_radiation/01_NB_ajout_departements_regions.ipynb` | Notebook qui filtre et ajoute les informations géographiques françaises |
| `notebooks/liaison_meteo_radiation/01_NB_ajout_departements_regions.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
