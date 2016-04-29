#delayed flights performance by airports
SELECT
   ORIGIN
   COUNT(IF(DEP_DELAY > 10, "", NULL)),
   COUNT(*), COUNT(IF(DEP_DELAY > 10, "", null)) / COUNT PCENT
   FROM airline
   GROUP BY ORIGIN
   ORDER BY PCENT DESC;
