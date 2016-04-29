#worst day of the month for delays caused by weather in ATL
SELECT DAY_OF_MONTH, COUNT(IF(WEATHER_DELAY > 0, "", NULL)) AS wst
FROM airline
WHERE ORIGIN LIKE '%ATL%'
GROUP BY DAY_OF_MONTH
ORDER BY wst DESC
LIMIT 1;
