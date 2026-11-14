/* Table de faits se concentrant sur les mesures de vols séparées en trois relevées (first, mid, last) */
SELECT

    endTime,
    airportOrigin,
    airportDestination,
    'FIRST' AS measurementPosition,
    value,
    firstLatitude AS latitude,
    firstLongitude  AS longitude,
    apparatusId,
    userId,
    reliability,
    dury,
    reportUuid

FROM {{ source('silver', 'flying_measures') }}

WHERE firstLongitude IS NOT NULL AND firstLatitude IS NOT NULL
UNION ALL

SELECT
    endTime,
    airportOrigin,
    airportDestination,
    'MID' AS measurementPosition,
    value,
    midLongitude AS longitude,
    midLatitude AS latitude,
    apparatusId,
    userId,
    reliability,
    dury,
    reportUuid

FROM {{ source('silver', 'flying_measures') }}

WHERE midLongitude IS NOT NULL AND midLatitude IS NOT NULL


UNION ALL

SELECT
    endTime,
    airportOrigin,
    airportDestination,
    'LAST' AS measurementPosition,
    value,
    lastLatitude AS latitude,
    lastLongitude AS longitude,
    apparatusId,
    userId,
    reliability,
    dury,
    reportUuid

FROM {{ source('silver', 'flying_measures') }}

WHERE LastLongitude IS NOT NULL
    AND 
    LastLatitude IS NOT NULL