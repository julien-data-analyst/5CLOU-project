
/* Table statistique sur les mesures au sol précisément */
WITH environment_counts AS (

    SELECT
        measurementEnvironment,
        COUNT(*) AS number_of_measures

    FROM {{ ref('fact_ground_measures') }}

    GROUP BY measurementEnvironment

)

SELECT
    measurementEnvironment,
    number_of_measures,

    ROUND(
        number_of_measures * 100.0 /
        SUM(number_of_measures) OVER (),
        2
    ) AS environment_proportion

FROM environment_counts