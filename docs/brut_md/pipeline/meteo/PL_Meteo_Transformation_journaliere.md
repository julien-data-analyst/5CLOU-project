# Pipeline de transformation quotidienne des données météorologiques

## 1. Descriptif 

- **Nom :** PL_Meteo_Transformation_journalière
- **Type :** Pipeline de données Microsoft Fabric
- **Espace de travail :** 5clou-project
- **Dossier :** Meteo
- **Fréquence d'exécution :** Quotidienne, à 9 h (heure de Paris)

Ce pipeline permet d'automatiser la préparation quotidienne
des observations météorologiques issues de Météo-France.

Il organise les traitements en trois étapes successives :
copie des données depuis Eventhouse vers la couche Bronze,
extraction des données JSON, puis nettoyage et préparation
de la couche Silver.

### Capture d'écran du pipeline

![Pipeline de transformation météo](01_vue_generale_pipeline_meteo.png)

*Figure 1 — Exécution réussie des trois activités du pipeline
de transformation quotidienne des données météorologiques.*
