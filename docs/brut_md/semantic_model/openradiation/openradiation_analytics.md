# Descriptif rapide 
- Nom : openradiation_analytics
- Type : Modèle sémantique 
- Date de modification : 15/11/2026
- Description : un modèle sémantique qui contient les tables analytiques

## Quoi ?

C'est un élément qui sert a la création d'un modèle d'analyse pour après être utilisé dans un rapport Power BI.

Elle est seulement dépendante du lakehouse **openradiation_lakehouse** dont on récupère les tables analytiques dans le schéma *gold*.

![alt text](semantic_model.png)

## Pourquoi ?

Il sert principalement comme étape de liaison entre nos tables lakehouses et notre rapport Power BI avec insertion de nos relations.

Cela permets aussi de gérer plus facilement les formats des valeurs, les relations et mesures à calculer.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données dans les tables analytiques du lakehouse dans le schéma *gold*.

Ca se fait via une configuration de la connection au lakehouse concerné.

![alt text](config_connect_lakehouse.png)

Ensuite on choisit nos tables dans notre schéma *gold*.

![alt text](choose_gold_tables.png)

### Destination

Enregistrement dans le modèle sémantique.
