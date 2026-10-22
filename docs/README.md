# Documentation Microsoft Fabric

**Règle fondamentale : un élément documenté, un fichier Markdown dédié et un commit cohérent, accompagné des notebooks ou modèles dbt associés lorsqu'ils font partie du changement et de captures d'écran pour les configurations et étapes de préparations dans l'outil. Ne pas tout regrouper dans un seul commit.**

## 1. Objectif

Ce dépôt a pour objectif de documenter les différents éléments créés dans Microsoft Fabric afin de garantir la traçabilité, la compréhension et la maintenabilité de l'architecture de données.

Chaque élément créé doit disposer d'un document Markdown dédié décrivant son rôle, sa justification, ses dépendances et sa configuration.

Les notebooks, modèles dbt et autres fichiers techniques associés doivent être versionnés avec leur documentation dans des commits cohérents et indépendants.

## 2. Structure de la documentation

Chaque élément Microsoft Fabric doit posséder son propre fichier Markdown.

Exemple d'organisation du dépôt :

```text
.
├── brut_md/
│   ├── lakehouse/
│   │   └── lakehouse_bronze.md
│   ├── eventhouse/
│   │   └── eventhouse_monitoring.md
│   ├── warehouse/
│   │   └── warehouse_reporting.md
│   ├── notebook/
│   │   └── notebook_ingestion.md
│   ├── pipeline/
│   │    └── pipeline_ingestion.md
│   └── dbt/
|       └── dbt_analytics.md/dbt_elt.md
|
└── README.md
```

Cette structure est indicative et doit être adaptée à l'organisation réelle du projet.

Les éléments documentés peuvent notamment inclure :

- Lakehouse
- Warehouse
- Eventhouse
- KQL Database
- Notebooks
- Pipelines
- Dataflows Gen2
- Modèles sémantiques
- Rapports Power BI
- Modèles dbt
- Autres éléments Fabric utilisés dans l'architecture

## 3. Contenu obligatoire d'une documentation

Chaque fichier Markdown doit suivre le modèle ci-dessous.

### 3.1. Identification de l'élément

Préciser les informations permettant d'identifier l'élément dans Microsoft Fabric.

- **Nom :** nom de l'élément.
- **Type :** type d'élément Fabric.
- **Date de création/modification :** date de création ou de dernière modification significative.
- **Description** : Quoi ? Pourquoi ? Comment ? Source ? Destination ?

### 3.2. Quoi ? — Description de l'élément

Expliquer ce qu'est l'élément et son rôle dans l'architecture.

Préciser :
- Sa nature et son fonctionnement.
- Les données ou traitements qu'il contient.
- Sa responsabilité fonctionnelle ou technique.
- Sa place dans l'architecture globale.

L'objectif est de permettre à un lecteur de comprendre l'utilité de l'élément sans avoir à examiner directement sa configuration dans Fabric.

### 3.3. Pourquoi ? — Justification

Expliquer pourquoi cet élément a été créé et pourquoi cette solution a été retenue.

Préciser :
- Le besoin métier ou technique auquel il répond.
- Le problème qu'il permet de résoudre.
- Les raisons du choix de cet élément plutôt qu'une autre solution.
- Les éventuelles contraintes de performance, de sécurité, de volumétrie ou de maintenance.

### 3.4. Sources et destinations — Flux de données et dépendances

Décrire les entrées et les sorties de l'élément afin de comprendre son rôle dans les flux de données.

**Sources :**
- Origine des données.
- Nom et type des éléments sources.
- Tables, fichiers, API, bases de données ou autres ressources utilisées.
- Mode de connexion ou d'accès, si pertinent.

**Destinations :**
- Éléments Fabric alimentés ou utilisés en sortie.
- Tables, fichiers, bases de données ou modèles concernés.
- Consommateurs en aval, tels que des notebooks, des modèles dbt ou des rapports Power BI.
- Type d'opération réalisée : ingestion, transformation, agrégation, exposition ou autre.

**Dépendances :**
- Éléments nécessaires au fonctionnement.
- Ordre d'exécution éventuel.
- Relations avec les pipelines et autres traitements.

Un schéma de flux peut être ajouté si cela facilite la compréhension.

### 3.5. Comment ? — Création et configuration

Décrire comment l'élément a été créé et configuré dans Microsoft Fabric.

Préciser :
- Les étapes de création.
- Les paramètres importants.
- Les configurations spécifiques.
- Les transformations ou traitements appliqués.
- Les connexions et dépendances configurées.
- Les règles de nommage utilisées.
- Les choix techniques importants.

Ajouter des captures d'écrans à l'appui pour montrer les différentes étapes de configurations et de préparations.

Lorsque cela est pertinent, ajouter des extraits de code, des requêtes SQL ou KQL, 
des références vers les notebooks et les modèles dbt, ou des liens vers les ressources associées.

Ne jamais inclure de mots de passe, de clés d'accès, de secrets ou d'autres informations sensibles dans la documentation.

### 3.6. Fichiers associés

Lister les fichiers techniques associés à l'élément documenté.

Pour chaque fichier, indiquer :
- Son chemin dans le dépôt.
- Son rôle.
- Son lien avec l'élément Fabric.

Exemple :

| Fichier | Rôle |
|---|---|
| `notebooks/ingestion_clients.ipynb` | Notebook d'ingestion des données clients |
| `dbt/models/staging/stg_clients.sql` | Modèle dbt de préparation des données clients |

Si aucun fichier technique n'est associé, le préciser.

### 3.7. Points d'attention et maintenance

Documenter les informations utiles à la maintenance de l'élément :

- Prérequis d'exécution.
- Contraintes connues.
- Limites techniques.
- Règles de qualité des données.
- Risques et points de vigilance.
- Évolutions à prévoir, si elles sont identifiées.

## 4. Règles de versionnement Git

### 4.1. Un commit par élément documenté

**Chaque commit doit concerner un seul élément Microsoft Fabric.**

Un commit doit contenir :

1. Le document Markdown dédié à l'élément concerné.
2. Les notebooks, modèles dbt ou autres fichiers techniques directement associés à cet élément, lorsqu'ils sont ajoutés ou modifiés dans le cadre de son implémentation.

Il ne faut pas regrouper la documentation de plusieurs éléments indépendants dans un même commit.

Par exemple, la documentation d'un Eventhouse et celle d'un Lakehouse doivent faire l'objet de commits distincts, 
même s'ils appartiennent au même flux de données.

### 4.2. Exemples de commits attendus

**Exemple 1 — Création et documentation d'un Eventhouse**

```text
docs(eventhouse): documenter eventhouse_monitoring
```

Fichiers concernés :
- `docs/eventhouse/eventhouse_monitoring.md`
- Les notebooks ou modèles dbt directement liés à cet Eventhouse, s'ils font partie de cette modification.

**Exemple 2 — Création et documentation d'un Lakehouse**

```text
docs(lakehouse): documenter lakehouse_bronze
```

Fichiers concernés :
- `docs/lakehouse/lakehouse_bronze.md`
- Les notebooks ou modèles dbt directement liés au Lakehouse, s'ils font partie de cette modification.

**Exemple 3 — Création et documentation d'un pipeline**

```text
docs(pipeline): documenter pipeline_ingestion
```

Fichiers concernés :
- `docs/pipeline/pipeline_ingestion.md`
- Les ressources techniques directement associées au pipeline, si elles sont ajoutées ou modifiées dans le cadre de cette modification.

### 4.3. Commits à éviter 

Ne pas effectuer un commit global regroupant plusieurs éléments indépendants.

Exemple à éviter :

```text
feat(fabric): ajouter toute l'architecture de données
```

Ce commit pourrait mélanger :
- La documentation d'un Eventhouse.
- La documentation d'un Lakehouse.
- La documentation d'un Warehouse.
- Plusieurs notebooks sans séparation logique.
- Plusieurs modèles dbt indépendants.

Cette approche rend les revues de code, l'identification des changements et les retours arrière plus difficiles.

### 4.4. Cas des fichiers partagés

Si un notebook, un modèle dbt ou une ressource technique est utilisé par plusieurs éléments, son rattachement à un commit doit être déterminé selon la modification réalisée.

Dans ce cas :
- Éviter de dupliquer inutilement un même fichier.
- Documenter les dépendances partagées.
- Isoler les modifications communes lorsqu'elles peuvent être versionnées indépendamment.
- Conserver des commits compréhensibles et cohérents.

Un fichier partagé ne doit pas être artificiellement rattaché à plusieurs commits s'il s'agit exactement de la même modification.

## 5. Convention de nommage

Utiliser des noms explicites, cohérents et faciles à retrouver.

Pour les documents Markdown :

```text
docs/<type_element>/<nom_element>.md
```

Exemples :

```text
docs/eventhouse/eventhouse_monitoring.md
docs/lakehouse/lakehouse_bronze.md
docs/warehouse/warehouse_reporting.md
docs/pipeline/pipeline_ingestion.md
```

Pour les messages de commit, utiliser une convention explicite :

```text
type(scope): description courte
```

Exemples :
- `docs(eventhouse): documenter eventhouse_monitoring`
- `docs(lakehouse): documenter lakehouse_bronze`
- `feat(notebook): ajouter notebook_ingestion_clients`
- `feat(dbt): ajouter modele stg_clients`

Le préfixe doit refléter la nature réelle du changement : documentation, création de code, correction ou évolution technique.

## 6. Checklist avant chaque commit

Avant de valider un commit, vérifier les points suivants :

- [ ] Un seul élément Microsoft Fabric est concerné.
- [ ] Un document Markdown dédié décrit cet élément.
- [ ] Les sections « Quoi ? », « Pourquoi ? », « Sources et destinations » et « Comment ? » sont renseignées.
- [ ] Les notebooks et modèles dbt associés sont identifiés.
- [ ] Les fichiers techniques ajoutés ou modifiés sont cohérents avec la documentation.
- [ ] Les dépendances et les flux de données sont décrits.
- [ ] Aucune information sensible n'est présente.
- [ ] Le message de commit décrit clairement l'élément et le changement.
- [ ] Les modifications concernant d'autres éléments indépendants sont conservées dans des commits séparés.

## 7. Principe général

La documentation doit évoluer en même temps que les éléments techniques qu'elle décrit.

Chaque élément Fabric doit être compréhensible, traçable et maintenable indépendamment des autres éléments du projet.

