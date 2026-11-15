
WITH source_data AS (

    SELECT
        CAST(observation_date AS DATE) AS date,
        nom_region AS region,
        temperature_k,
        humidite_pct,
        vitesse_vent,
        direction_vent,
        `precipitations`,
        temperature_c

    FROM `meteo_radiation_lakehouse`.`silver`.silver_french_meteo_measure

),

aggregated AS (

    SELECT
        date,
        region,
        COUNT(*) AS nb_lignes,
        AVG(temperature_k) AS moyenne_temp_k,
        AVG(humidite_pct) AS moyenne_humidite_pct,
        AVG(vitesse_vent) AS moyenne_vitesse_vent,
        AVG(direction_vent) AS moyenne_direction_vent,
        AVG(`precipitations`) AS moyenne_precipitations,
        AVG(temperature_c) AS moyenne_temp_c

    FROM source_data

    GROUP BY
        date,
        region

),

deduplicated AS (

    SELECT DISTINCT
        date,
        region,
        nb_lignes,
        moyenne_temp_k,
        moyenne_humidite_pct,
        moyenne_vitesse_vent,
        moyenne_direction_vent,
        moyenne_precipitations,
        moyenne_temp_c

    FROM aggregated

)

SELECT *
FROM deduplicated
