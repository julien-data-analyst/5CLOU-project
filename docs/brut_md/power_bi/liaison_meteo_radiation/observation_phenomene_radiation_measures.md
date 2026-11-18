# Descriptif rapide 
- Nom : observation_phenomene_radiation_measures
- Type : rapport Power BI 
- Date de modification : 16/11/2026
- Description : un rapport Power BI analysant la liaison des mesures de radiations et météorologiques

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../README.md)
- [Rapport Power BI](../README.md)

## Quoi ?

C'est un élément qui sert à la création d'un rapport d'analyse sur la table marts **marts_meteo_radiation** du lakehouse **meteo_radiation_lakehouse**.

Il est connecté au modèle sémantique **MS_meteo_radiation_measures** qui lui-même est connecté à la table lakehouse concernée dans le schéma *gold*.

## Pourquoi ?

Ce rapport à pour but d'analyser la liaison entre ces deux mesures à travers deux grands axes :
- Géographique : observation sur les zones régionales les mesures relevées avec les indicateurs météorologiques, un filtre temporel a été ajouté afin de voir l'évolution des mesures de radiations sur la zone géographique
- Temporel : observation des mesures dans un axe temporel les indicateurs météorologiques avec la valeur de radiation mesurée afin de pouvoir comparer et voir leurs relations entre elles (valeur de radiation en moyenne, température en moyenne et précipitation en moyenne et ce par jour)

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération de la table analytique du modèle sémantique **MS_meteo_radiation_measures**.