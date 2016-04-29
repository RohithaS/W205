#Effect of flight distance on average departure delay
SELECT DISTANCE, AVG(DEP_DELAY) AS AVG_DELAY
FROM airline
GROUP BY DISTANCE
ORDER BY AVG_DELAY DESC
LIMIT 1500;
