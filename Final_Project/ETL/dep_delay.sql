#average monthly departure delay
SELECT MONTH, AVG(DEP_DELAY) AS AVG_DELAY
FROM airline
GROUP BY MONTH
ORDER BY MONTH;
