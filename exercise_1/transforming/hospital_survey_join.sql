#Build hospital_procedure table
DROP TABLE hospital_survey;
CREATE TABLE hospital_survey AS
SELECT a.*, b.overall_achieve, b.hcahps_base_score, b.hcahps_consistency_score
FROM hospitals a
LEFT OUTER JOIN survey_responses b
ON (a.provider_id = b.provider_id);
