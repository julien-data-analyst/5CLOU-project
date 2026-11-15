
{{ config(
    materialized = 'table'
) }}

WITH meteo AS (

    SELECT
        date,
        region,
        nb_lignes AS nb_observations_meteo,
        moyenne_temp_k,
        moyenne_temp_c,
        moyenne_humidite_pct,
        moyenne_vitesse_vent,
        moyenne_direction_vent,
        moyenne_precipitations

    FROM {{ ref('meteo_measures_aggregated') }}

),

radiation AS (

    SELECT
        date,
        region,
        nb_lignes AS nb_observations_radiation,
        moyenne AS moyenne_radiation,
        mediane AS mediane_radiation,
        q1 AS q1_radiation,
        q3 AS q3_radiation

    FROM {{ ref('radiation_measures_aggregated') }}

),

mart AS (

    SELECT

        COALESCE(m.date, r.date) AS date,
        COALESCE(m.region, r.region) AS region,

        -- Indicateurs météorologiques
        m.nb_observations_meteo,
        m.moyenne_temp_k,
        m.moyenne_temp_c,
        m.moyenne_humidite_pct,
        m.moyenne_vitesse_vent,
        m.moyenne_direction_vent,
        m.moyenne_precipitations,

        -- Indicateurs de radiation
        r.nb_observations_radiation,
        r.moyenne_radiation,
        r.mediane_radiation,
        r.q1_radiation,
        r.q3_radiation

    FROM meteo m

    INNER JOIN radiation r

        ON m.date = r.date
        AND m.region = r.region

)

SELECT *
FROM mart
