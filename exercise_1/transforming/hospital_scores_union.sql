#Build hospital_scores table from effective_care and readmissions

# Union effective_care with readmissions--
DROP TABLE hospital_scores;
CREATE TABLE hospital_scores AS
SELECT state, measure_id, measure_name Null as score
FROM readmissions
UNION ALL
SELECT state, measure_id, measure_name, Null as num_hospitals_better, Null as num_hospitals_worse, score
FROM effective_care;
