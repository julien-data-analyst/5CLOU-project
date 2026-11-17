# Introduction

**Ici, vous trouverez tous les markdowns créés pour la documentation des tâches notebooks dans Fabric.**


**Règle fondamentale : un élément documenté, un fichier Markdown dédié et un commit cohérent, accompagné des notebooks ou modèles dbt associés lorsqu'ils font partie du changement et de captures d'écran pour les configurations et étapes de préparations dans l'outil. Ne pas tout regrouper dans un seul commit.**

# Exploration des ressources de notebooks Fabrics

Pour explorer les différentes ressources de notebooks créées dans le cadre de ce flux, vous pouvez explorer ce sommaire permettant d'aller sur chaque ressource concernée (aller sur le dépôt GitHub public pour bénéficier de cela) :

## OpenRadiation 

### Exploration des données
- [exploration_openradiation](./openradiation/exploration/exploration_openradiation.md)

### Ingestion des données
- [NB_01_INGEST_TAR_FILE](./openradiation/ingest/01_tar_file/NB_01_INGEST_TAR_FILE.md)
- [NB_02_EXTRACT_MEASUREMENT_CSV](./openradiation/ingest/02_extract_csv_file/NB_02_EXTRACT_MEASUREMENT_CSV.md)
- [NB_03_INGEST_INTO_LAKEHOUSE](./openradiation/ingest/03_ingest_into_lakehouse/NB_03_INGEST_INTO_LAKEHOUSE.md)

### Nettoyage des données
- [04_NB_CLEAN_MEASURES](./openradiation/clean/04_NB_CLEAN_MEASURES.md)

### Mesures au vol/sol
- [04_NB_FLYING_MEASURES](./openradiation/clean/04_NB_FLYING_MEASURES.md)
- [04_NB_GROUND_MEASURES](./openradiation/clean/04_NB_GROUND_MEASURES.md)

## Météo France

### Streaming des données
- [NB_Event_Meteo_France](./meteo/stream/NB_Event_Meteo_France.md)

### Préparation des données
- [NB_01_Preparation_Silver](./meteo/prepare/01_silver_prepare/NB_01_Preparation_Silver.md)
- [NB_02_Parsing_JSON](./meteo/prepare/02_parsing/NB_02_Parsing_JSON.md)
- [NB_03_Nettoyage_Silver](./meteo/prepare/03_silver_clean/NB_03_Nettoyage_Silver.md)

## Liaison radiation et météo
- [01_NB_ajout_departements_regions](./liaison_meteo_radiation/01_NB_ajout_departements_regions.md)