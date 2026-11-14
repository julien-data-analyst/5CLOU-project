
/* Table statistique détaillé sur les couples de stations d'origines et de destinations */
WITH airport_counts AS (

    SELECT
        airportOrigin,
        airportDestination,

        COUNT(DISTINCT reportUuid) AS number_of_flights

    FROM {{ ref('fact_flying_measures') }}

    WHERE airportOrigin IS NOT NULL
    AND airportDestination IS NOT NULL

    GROUP BY
        airportOrigin,
        airportDestination

    
)

SELECT
    airportOrigin,
    airportDestination,
    number_of_flights,

    ROUND(
        number_of_flights * 100.0 /
        SUM(number_of_flights) OVER (),
        2
    ) AS route_proportion

FROM airport_counts