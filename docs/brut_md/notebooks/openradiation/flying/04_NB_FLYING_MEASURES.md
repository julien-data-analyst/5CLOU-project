# Descriptif rapide 
- Nom : 04_NB_FLYING_MEASURES
- Type : Notebook python 
- Date de modification : 15/11/2026
- Description : un notebook qui permets de capturer les mesures au vol

## Quoi ?

C'est un élément qui sert au nettoyage des données de mesures en virant par exemple les mesures aberrantes.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** qui va contenir la table des mesures au vol **flying_measures** dans le schéma *silver*.


## Pourquoi ?

Il sert principalement comme cinquième étape de notre flux pour les mesures de radiations.

Ces données sont ingérées dans notre lakehouse qui seront ensuite traitées par les autres notebooks.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données dans la table nettoyée nommée **clean_measures** dans le schéma *silver*.

### Destination

Qui va ensuite être enregistré dans la table **flying_measures** dans le schéma *silver*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/openradiation/flying/04_NB_FLYING_MEASURES.ipynb` | Notebook de capture des mesures au vol et sauvegarde des résultats |
| `notebooks/openradiation/flying/04_NB_FLYING_MEASURES.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
