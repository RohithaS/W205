#Transform survey_results by removing columns
DROP TABLE survey_responses;
CREATE TABLE survey_responses AS
SELECT provider_id, hospital_name, com_nurse_achieve, com_doc_achieve, hos_staff_achieve, paid_man_achieve, com_med_achieve, clean_quiet_achieve, discharge_achieve, overall_achieve, hcahps_base_score, hcahps_consistency_score
FROM survey_responses1;
