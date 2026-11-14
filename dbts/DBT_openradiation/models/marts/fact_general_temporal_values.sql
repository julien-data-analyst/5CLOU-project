/* Table de faits sur les mesures axé sur l'aspect temporelle */
SELECT
    CAST(endTime AS DATE) AS endDate,
    apparatusId,
    dury,
    userId,
    measurementEnvironment,
    value,
    atypical,
    qualification,
    reportUuid

FROM {{ source('silver', 'clean_measures') }}