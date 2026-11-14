/* Table de faits sur les mesures au sol */
SELECT
    endTime,
    endLatitude,
    endLongitude,
    apparatusId,
    value,
    userId,
    reportUuid,
    measurementEnvironment,
    dury,
    qualification,
    reliability

FROM {{ source('silver', 'ground_measures') }}
WHERE qualification = 'groundlevel'