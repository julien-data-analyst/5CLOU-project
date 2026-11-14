/* Table de statistiques contenant le nombre de mesures par type de mesure (sol, vol, etc) */
SELECT
    qualification, COUNT(*) AS effectif
FROM {{ source('silver', 'clean_measures') }}
GROUP BY qualification