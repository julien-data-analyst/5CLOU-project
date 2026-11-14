
/* Permets de sélectionner les appareils distinctes utilisées pour les relevées */
SELECT DISTINCT
    apparatusId,
    apparatusSensorType,
    apparatusTubeType

FROM {{ source('silver', 'clean_measures') }}

WHERE apparatusId IS NOT NULL AND apparatusSensorType IS NOT NULL AND apparatusTubeType IS NOT NULL