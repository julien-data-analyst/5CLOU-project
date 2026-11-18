# Descriptif rapide 
- Nom : MS_meteo_radiation_measures
- Type : Modèle sémantique 
- Date de modification : 16/11/2026
- Description : un modèle sémantique qui contient les tables analytiques liées entre les mesures météorologiques et de radiations

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../README.md)
- [Modèles sémantiques](../README.md)

## Quoi ?

C'est un élément qui sert à la création d'un modèle d'analyse pour après être utilisé dans un rapport Power BI.

Elle est seulement dépendante du lakehouse **meteo_radiation_lakehouse** dont on récupère les tables analytiques dans le schéma *gold*.

![alt text](semantic_model.png)

## Pourquoi ?

Il sert principalement comme **étape de liaison** entre la table de liaison des mesures aggrégées **marts_meteo_radiation** et le rapport Power BI **observation_phenomene_radiation_meteo**.

Cela permets aussi de gérer plus facilement les formats des valeurs, les relations et mesures à calculer.

Une nouvelle table sera créée pour pouvoir choisir les champs numériques à observer (les indicateurs statistiques).

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données dans les tables analytiques du lakehouse dans le schéma *gold*.

Une configuration dans le lakehouse devra être effectuée pour récupérer les tables concernées.

![alt text](config_connect_lakehouse.png)

Ensuite, on choisit nos tables dans notre schéma *gold*.

![alt text](choose_gold_tables.png)

### Destination

Enregistrement dans le modèle sémantique.
