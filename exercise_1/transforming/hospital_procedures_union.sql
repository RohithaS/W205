#Build state_procedures table from readmissions, and effective_care

#UUnion effective_care and readmissions
DROP TABLE readmissions;
CREATE TABLE readmissions AS
SELECT provider_id, hospital_name, state, measure_id, measure_name, compared_to_national, denominator, score
FROM effective_care
UNION ALL
SELECT provider_id, hospital_name, state, measure_id, measure_name, compared_to_national, denominator, score
FROM readmissions;
