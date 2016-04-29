#Join the tables airline and routes
CREATE TABLE airline_routes AS
SELECT DISTINCT airline_id
FROM routes
UNION ALL
SELECT DISTINCT airline_id
FROM airline;
