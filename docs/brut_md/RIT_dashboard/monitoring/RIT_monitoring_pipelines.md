
# Descriptif rapide 
- Nom : RIT_monitoring_pipelines
- Type : Dashboard RIT
- Date de modification : 16/11/2026
- Description : un dashboard en temps réel observant précisément les activités de type pipeline

Sommaire pour explorer d'autres types, ressources :

- [Accueil](../../../../README.md)
- [Dashboard RIT](../README.md)

## Quoi ?

C'est un élément permettant **de créer un dashboard en temps réel à partir d'un eventhouse**.

L'eventhouse utilisé en question est appelé **monitoring_eventhouse** qui contient les informations nécessaires des pipelines.

Nous y observons principalement **les activités de type pipeline et leurs exécutions**.

## Pourquoi ?

Ce dashboard RIT à pour but de surveiller l'exécution des pipelines à travers deux grands axes :
- **les durées d'exécution de nos pipelines et de leurs activités**
- **le nombre d'erreur produits sur l'exécution de ces pipelines planifiées**

Elles permettront d'agir dans **l'optimisation de nos pipelines** en identifiant les étapes qui ralentissent le plus et les pipelines qui produisent le plus d'erreur.

![alt text](premiere_partie_dashboard.png)

![alt text](deuxieme_partie_dashboard.png)


## Comment ?

Nous avons créé un dashboard temps réel nommé **RIT_monitoring_pipelines** dans notre espace de travail Microsoft Fabric `5clou-project`.

Pour afficher les activités de nos pipelines, nous avons utilisé les données stockées dans l'Eventhouse `monitoring_eventhouse`, et plus précisément dans les tables `ItemJobEventLogs` et `FabricDataPipelinesActivityRunsLogs`.

Cette connexion permet au dashboard d'interroger les données d'activités de pipelines disponibles dans l'Eventhouse et de les restituer sous forme de visualisations interactives.

Les différentes visualisations ont ensuite été organisées dans le dashboard afin de faciliter la lecture et l'analyse des observations.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération à partir de requêtes KQL calculant le temps d'exécution et d'autres indicateurs statistiques sur les pipelines dans l'eventhouse **monitoring_eventhouse**.