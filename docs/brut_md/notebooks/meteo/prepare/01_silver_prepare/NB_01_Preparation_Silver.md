# Descriptif rapide 
- Nom : NB_01_Preparation_Silver
- Type : Notebook python 
- Date de modification : 17/11/2026
- Description : un notebook qui permets de nettoyer les données météorologiques copiées collées dans la table brute

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../../README.md)
- [Notebooks](../../../README.md)

## Quoi ?

C'est un élément qui sert à la préparation des données de mesures en extrayant les champs JSON, contrôlant les valeurs manquantes, conversion des températures de Kelvin en Celsius, vérification des coordonnées géographiques et de l'humidité.

Elle est seulement dépendante du lakehouse **lakehouse_meteo_france** qui va contenir la table nettoyée **silver_meteo_france** dans le schéma *dbo*.

Cet élément a servi d'exploration pour la préparation des données dans un seul notebook.

## Pourquoi ?

Il sert principalement à explorer les données et à les préparer de sorte qu'on sache quelles étapes on devra appliquer.

Elle en résultera deux notebooks qui exécuteront dans l'ordre le parsing et ensuite le nettoyage.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données d'une table brute nommée **raw_meteo_france** dans le schéma *dbo*.

### Destination

Qui va ensuite être enregistré dans la table **silver_meteo_france** dans le schéma *dbo*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/meteo/prepare/01_silver_prepare/NB_01_Preparation_Silver.ipynb` | Notebook de nettoyage des mesures et sauvegarde dans la table silver |
| `notebooks/meteo/prepare/01_silver_prepare/NB_01_Preparation_Silver.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
