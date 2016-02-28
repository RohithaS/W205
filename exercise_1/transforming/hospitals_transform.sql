#Transform hospitals by removing columns
DROP TABLE hospitals;
CREATE TABLE hospitals AS
SELECT provider_id, hospital_name, hospital_type, state FROM hospitals;
