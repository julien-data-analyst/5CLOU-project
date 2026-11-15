# Descriptif rapide 
- Nom : 04_NB_CLEAN_MEASURES
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets de nettoyer les données des mesures

## Quoi ?

C'est un élément qui sert au nettoyage des données de mesures en virant par exemple les mesures aberrantes.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir la table nettoyée **clean_measures** dans le schéma *silver*.


## Pourquoi ?

Il sert principalement comme quatrième étape de notre flux pour les mesures de radiations.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données d'une table brute nommée **radiation_measures** dans le schéma *raw*.

### Destination

Qui va ensuite être enregistré dans la table **clean_measures** dans le schéma *silver*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/clean/04_NB_CLEAN_MEASURES.ipynb` | Notebook de nettoyage des mesures et sauvegarde dans la table silver |
| `notebooks/openradiation/clean/04_NB_CLEAN_MEASURES.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
