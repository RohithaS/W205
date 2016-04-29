# correlation between distance and arrival delay
SELECT CORR(CAST(DISTANCE AS DOUBLE),
       CAST(ARR_DELAY AS DOUBLE))
       FROM airline;
