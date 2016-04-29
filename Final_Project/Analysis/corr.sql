# correlation between departure delays and arrival delays
SELECT CORR(CAST(DEP_DELAY) AS DOUBLE),
        CAST(ARR_DELAY AS DOUBLE)
        FROM airline;
