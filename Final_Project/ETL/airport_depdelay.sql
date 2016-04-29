SELECT COUNT(DEP_DELAY), ORIGIN AS LOG_COUNT_DEP
FROM airline
WHERE DEP_DELAY > 0
GROUP BY ORIGIN
ORDER BY LOG_COUNT_DEP
LIMIT 50;
