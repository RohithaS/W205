#Build hospital_measures table from measure_dates and effective_care union
DROP TABLE Measures_and_Care;
CREATE TABLE Measures_and_Care AS
SELECT DISTINCT measure_id
FROM effective_care
UNION ALL
SELECT DISTINCT measure_id
FROM Measures;

#Form a table with Measure IDs
DROP TABLE hospital_measures;
CREATE TABLE hospital_measures AS
SELECT DISTINCT measure_id
FROM Measures_and_Care;
DROP TABLE Measures_and_Care;
