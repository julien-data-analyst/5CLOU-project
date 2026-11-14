
/* Table statistique générale sur les mesures par année, mois et général */
WITH base AS (

    SELECT
        *,
        YEAR(endDate) AS measurementYear,
        MONTH(endDate) AS measurementMonth

    FROM {{ ref('fact_general_temporal_values') }}

),

-- Nombre de mesures par qualification
qualification_stats AS (

    SELECT
        'QUALIFICATION' AS analysis_type,
        qualification,
        CAST(NULL AS STRING) AS apparatusId,
        CAST(NULL AS INT) AS measurementYear,
        CAST(NULL AS INT) AS measurementMonth,

        COUNT(*) AS number_of_measures,
        COUNT(value) AS radiation_effective,

        AVG(value) AS radiation_mean,

        PERCENTILE_APPROX(
            value, 0.5
        ) AS radiation_median,

        PERCENTILE_APPROX(
            value, 0.25
        ) AS radiation_q1,

        PERCENTILE_APPROX(
            value, 0.75
        ) AS radiation_q3,

        SUM(CASE WHEN atypical = 1 THEN 1 ELSE 0 END)
            / CAST(COUNT(*) AS DOUBLE) AS atypical_proportion

    FROM base

    GROUP BY qualification

),

-- Statistiques globales par année et par mois
temporal_stats AS (

    SELECT
        'MONTH' AS analysis_type,
        CAST(NULL AS STRING) AS qualification,
        CAST(NULL AS STRING) AS apparatusId,
        measurementYear,
        measurementMonth,

        COUNT(*) AS number_of_measures,
        COUNT(value) AS radiation_effective,

        AVG(value) AS radiation_mean,

        PERCENTILE_APPROX(
            value, 0.5
        ) AS radiation_median,

        PERCENTILE_APPROX(
            value, 0.25
        ) AS radiation_q1,

        PERCENTILE_APPROX(
            value, 0.75
        ) AS radiation_q3,

        SUM(CASE WHEN atypical = 1 THEN 1 ELSE 0 END)
            / CAST(COUNT(*) AS DOUBLE) AS atypical_proportion

    FROM base

    GROUP BY measurementYear, measurementMonth

),

-- Statistiques par appareil et qualification
apparatus_stats AS (

    SELECT
        'APPARATUS' AS analysis_type,
        qualification,
        CAST(apparatusId AS STRING) AS apparatusId,
        CAST(NULL AS INT) AS measurementYear,
        CAST(NULL AS INT) AS measurementMonth,

        COUNT(*) AS number_of_measures,
        COUNT(value) AS radiation_effective,

        AVG(value) AS radiation_mean,

        PERCENTILE_APPROX(
            value, 0.5
        ) AS radiation_median,

        PERCENTILE_APPROX(
            value, 0.25
        ) AS radiation_q1,

        PERCENTILE_APPROX(
            value, 0.75
        ) AS radiation_q3,

        SUM(CASE WHEN atypical = 1 THEN 1 ELSE 0 END)
            / CAST(COUNT(*) AS DOUBLE) AS atypical_proportion

    FROM base

    GROUP BY qualification, apparatusId

)

SELECT * FROM qualification_stats

UNION ALL

SELECT * FROM temporal_stats

UNION ALL

SELECT * FROM apparatus_stats