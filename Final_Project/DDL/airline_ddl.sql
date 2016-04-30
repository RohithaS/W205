
CREATE EXTERNAL TABLE IF NOT EXISTS airline(
  YEAR string,
  QUARTER string,
  MONTH string,
  DAY_OF_MONTH string,
  DAY_OF_WEEK string,
  FL_DATE string,
  UNIQUE_CARRIER string,
  AIRLINE_ID string,
  TAIL_NUM string,
  FL_NUM string,
  ORIGIN_AIRPORT_ID string,
  ORIGIN string,
  DEST_AIRPORT_ID string,
  DEST string,
  DEP_DELAY string,
  ARR_DELAY string,
  CANCELLED string,
  DIVERTED string,
  DISTANCE string,
  CARRIER_DELAY string,
  WEATHER_DELAY string,
  NAS_DELAY string,
  SECURITY_DELAY string,
  LATE_AIRCRAFT_DELAY string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES ("separatorChar" = ",","quoteChar" = '"',"escapeChar" = '\\')
  STORED AS TEXTFILE LOCATION '/user/w205/project1/decemberdata';



CREATE EXTERNAL TABLE IF NOT EXISTS airports(
  AIRPORT_ID string,
  NAME string,
  CITY string,
  COUNTRY string,
  IATA string,
  ICAO string,
  LATITUDE string,
  LONGITUDE string,
  ALTITUDE string,
  TIMEZONE string,
  DST string,
  Tz string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES ("separatorChar" = ",","quoteChar" = '"',"escapeChar" = '\\')
  STORED AS TEXTFILE LOCATION '/user/w205/project1/airports';


CREATE EXTERNAL TABLE IF NOT EXISTS routes(
  AIRLINE string,
  AIRLINE_ID string,
  SOURCE_AIRPORT string,
  SOURCE_AIRPORT_ID string,
  DESTINATION_AIRPORT string,
  DESTINATION_AIRPORT_ID string,
  CODESHARE string,
  STOPS string,
  EQUIPMENT string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES ("separatorChar" = ",","quoteChar" = '"',"escapeChar" = '\\')
  STORED AS TEXTFILE LOCATION '/user/w205/project1/routes';
