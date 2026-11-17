# Descriptif rapide 
- Nom : report_OpenRadiation
- Type : rapport Power BI 
- Date de modification : 15/11/2026
- Description : un rapport Power BI analysant les mesures de radiations

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../README.md)
- [Rapport Power BI](../README.md)

## Quoi ?

C'est un élément qui sert a la création d'un rapport d'analyse sur les mesures de radiations.

Il est connecté au modèle sémantique **openradiation_analytics** qui lui-même est connecté aux tables lakehouse **openradiation_lakehouse** dans le schéma *gold*.

## Pourquoi ?

Ce rapport à pour but d'analyser ces mesures de radiations à travers différents axes :
- Général : observation du type de mesure et les appareils de mesures 
- Temporel : observation des mesures selon la valeur de radiation et le nombre de mesures au cours du temps
- Vol : observation des mesures concernant uniquement ceux qui ont été faits en vol
- Sol : observation des mesures concernant uniquement ceux qui ont été faits au sol

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération dans les tables analytiques du modèle sémantique **openradiation_analytics**.