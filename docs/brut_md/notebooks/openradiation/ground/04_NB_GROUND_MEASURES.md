# Descriptif rapide 
- Nom : 04_NB_GROUND_MEASURES
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets de capturer les mesures au sol

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../../README.md)
- [Notebooks](../../README.md)

## Quoi ?

C'est un élément qui sert à la capture des mesures au sol uniquement.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir la table des mesures au sol **ground_measures** dans le schéma *silver*.


## Pourquoi ?

Il sert principalement comme sixième étape de notre flux pour les mesures de radiations.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données dans la table nettoyée nommée **clean_measures** dans le schéma *silver*.

### Destination

Qui va ensuite être enregistré dans la table **ground_measures** dans le schéma *silver*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/ground/04_NB_GROUND_MEASURES.ipynb` | Notebook de capture des mesures au sol et sauvegarde des résultats |
| `notebooks/openradiation/ground/04_NB_GROUND_MEASURES.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
