
{{ config(
    materialized = 'table'
) }}

WITH source_data AS (

    SELECT
        CAST(`endTime` AS DATE) AS date,
        nom_region AS region,
        reportUuid,
        value

    FROM {{ source('silver', 'french_ground_measures') }}

),

aggregated AS (

    SELECT
        date,
        region,

        COUNT(DISTINCT reportUuid) AS nb_lignes,

        AVG(value) AS moyenne,

        PERCENTILE(value, 0.50) AS mediane,

        PERCENTILE(value, 0.25) AS q1,

        PERCENTILE(value, 0.75) AS q3

    FROM source_data

    GROUP BY
        date,
        region

)

SELECT *
FROM aggregated
