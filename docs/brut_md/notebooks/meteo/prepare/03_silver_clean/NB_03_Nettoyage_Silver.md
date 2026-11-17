# Descriptif rapide 
- Nom : NB_03_Nettoyage_Silver
- Type : Notebook python 
- Date de modification : 17/11/2026
- Description : un notebook qui permets de nettoyer les données météorologiques parsées 

## Quoi ?

C'est un élément qui sert à la préparation des données de mesures en nettoyant les mesures extraites du JSON et d'enlever les mesures aberrantes/manquantes.

Elle est seulement dépendante du lakehouse **lakehouse_meteo_france** qui va contenir la table parsée brute **** dans le schéma *dbo*.

## Pourquoi ?

Il sert principalement à la deuxième étape de notre flux de transformation journalières des mesures météorologiques.

Il permettra de parser les JSON et de pouvoir adapter en cas de changement/ajout de nouveaux champs et de le contrôler plus facilement à cette étape.

## Sources et destinations — Flux de données et dépendances

### Source 

Récupération des données d'une table brute nommée **raw_meteo_france_parsing** dans le schéma *dbo*.

### Destination

Qui va ensuite être enregistré dans la table **silver_meteo_france** dans le schéma *dbo*.


## Fichiers associés 

Les fichiers associés à cet élément sont  :

| Fichier | Rôle |
|---|---|
| `notebooks/meteo/prepare/03_silver_clean/NB_03_Nettoyage_Silver.ipynb` | Notebook de nettoyage des mesures et sauvegarde dans la table silver |
| `notebooks/meteo/prepare/03_silver_clean/NB_03_Nettoyage_Silver.html` | Notebook en version HTML pour observer les résultats sans exécuter de code |
