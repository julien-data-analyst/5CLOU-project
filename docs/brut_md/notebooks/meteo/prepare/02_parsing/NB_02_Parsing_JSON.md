# Descriptif rapide 
- Nom : NB_02_Parsing_JSON
- Type : Notebook python 
- Date de modification : 17/11/2026
- Description : un notebook qui permets d'extraire les champs dans le JSON des mesures météorologiques

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../../README.md)
- [Notebooks](../../../README.md)

## Quoi ?

C'est un élément qui sert à la préparation des données de mesures météorologiques en extrayant les champs JSON qu'on veut analyser.

Elle est seulement dépendante du lakehouse **lakehouse_meteo_france** qui va contenir la table parsée brute **raw_meteo_france_parsing** dans le schéma *dbo*.

## Pourquoi ?

Il sert principalement à la **deuxième étape de notre flux de transformation journalières des mesures météorologiques**.

Il permettra de parser les JSON des mesures et d'en extraires les indicateurs relevés (exemple : température).

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données d'une table brute nommée **raw_meteo_france** dans le schéma *dbo*.

### Destination

Qui va ensuite être enregistré dans la table **raw_meteo_france_parsing** dans le schéma *dbo*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/meteo/prepare/02_parsing/NB_02_Parsing_JSON.ipynb` | Notebook de parsing JSOn des mesures et sauvegarde dans une table résultante |
| `notebooks/meteo/prepare/02_parsing/NB_02_Parsing_JSON.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
