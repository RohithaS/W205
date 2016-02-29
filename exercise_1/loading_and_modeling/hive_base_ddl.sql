DROP TABLE hospitals;
CREATE EXTERNAL TABLE `hospitals`(
  `provider_id` string COMMENT 'from deserializer',
  `hospital_name` string COMMENT 'from deserializer',
  `address` string COMMENT 'from deserializer',
  `city` string COMMENT 'from deserializer',
  `state` string COMMENT 'from deserializer',
  `zip` string COMMENT 'from deserializer',
  `county` string COMMENT 'from deserializer',
  `phone` string COMMENT 'from deserializer',
  `hospital_type` string COMMENT 'from deserializer',
  `hospital_ownership` string COMMENT 'from deserializer')
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  '/user/w205/hospital_compare/Hospital_General_Information';



DROP TABLE Measures;
CREATE EXTERNAL TABLE `Measures`(
  `measure_name` string COMMENT 'from deserializer',
  `measure_id` string COMMENT 'from deserializer',
  `measure_start_quarter` string COMMENT 'from deserializer',
  `measure_start_date` string COMMENT 'from deserializer',
  `measure_end_quarter` string COMMENT 'from deserializer',
  `measure_end_date` string COMMENT 'from deserializer')
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  '/user/w205/hospital_compare//Measure_Dates';


  DROP TABLE effective_care;
  CREATE EXTERNAL TABLE `effective_care`(
    `provider_id` string COMMENT 'from deserializer',
    `hospital_name` string COMMENT 'from deserializer',
    `address` string COMMENT 'from deserializer',
    `city` string COMMENT 'from deserializer',
    `state` string COMMENT 'from deserializer',
    `zip` string COMMENT 'from deserializer',
    `county` string COMMENT 'from deserializer',
    `phone` string COMMENT 'from deserializer',
    `condition` string COMMENT 'from deserializer',
    `measure_id` string COMMENT 'from deserializer',
    `measure_name` string COMMENT 'from deserializer',
    `score` string COMMENT 'from deserializer',
    `sample` string COMMENT 'from deserializer',
    `footnote` string COMMENT 'from deserializer',
    `measure_start_date` string COMMENT 'from deserializer',
    `measure_end_date` string COMMENT 'from deserializer')
  ROW FORMAT SERDE
    'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  STORED AS INPUTFORMAT
    'org.apache.hadoop.mapred.TextInputFormat'
  OUTPUTFORMAT
    'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
  LOCATION
    '/user/w205/hospital_compare/hospital_compare/Timely_And_Effective_Care_Hospital';

    DROP TABLE readmissions;
    CREATE EXTERNAL TABLE `readmissions`(
      `provider_id` string COMMENT 'from deserializer',
      `hospital_name` string COMMENT 'from deserializer',
      `address` string COMMENT 'from deserializer',
      `city` string COMMENT 'from deserializer',
      `state` string COMMENT 'from deserializer',
      `zip` string COMMENT 'from deserializer',
      `county` string COMMENT 'from deserializer',
      `phone` string COMMENT 'from deserializer',
      `measure_name` string COMMENT 'from deserializer',
      `measure_id` string COMMENT 'from deserializer',
      `compared_to_national` string COMMENT 'from deserializer',
      `denominator` string COMMENT 'from deserializer',
      `score` string COMMENT 'from deserializer',
      `lower_estimate` string COMMENT 'from deserializer',
      `higher_estimate` string COMMENT 'from deserializer',
      `footnote` string COMMENT 'from deserializer',
      `measure_start_date` string COMMENT 'from deserializer',
      `measure_end_date` string COMMENT 'from deserializer')
    ROW FORMAT SERDE
      'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    STORED AS INPUTFORMAT
      'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT
      'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
    LOCATION
      '/user/w205/hospital_compare/hospital_compare/Readmissions_And_Deaths_Hospital';

    DROP TABLE survey_responses;
    CREATE EXTERNAL TABLE `survey_responses`(
      `provider_id` string COMMENT 'from deserializer',
      `hospital_name` string COMMENT 'from deserializer',
      `address` string COMMENT 'from deserializer',
      `city` string COMMENT 'from deserializer',
      `state` string COMMENT 'from deserializer',
      `zip` string COMMENT 'from deserializer',
      `county` string COMMENT 'from deserializer',
      `com_nurse_achieve` string COMMENT 'from deserializer',
      `com_nurse_improve` string COMMENT 'from deserializer',
      `com_nurse_dimension` string COMMENT 'from deserializer',
      `com_doc_achieve` string COMMENT 'from deserializer',
      `com_doc_improve` string COMMENT 'from deserializer',
      `com_doc_dimension` string COMMENT 'from deserializer',
      `hos_staff_achieve` string COMMENT 'from deserializer',
      `hos_staff_improve` string COMMENT 'from deserializer',
      `hos_staff_dimension` string COMMENT 'from deserializer',
      `paid_man_achieve` string COMMENT 'from deserializer',
      `paid_man_improve` string COMMENT 'from deserializer',
      `paid_man_dimension` string COMMENT 'from deserializer',
      `com_med_achieve` string COMMENT 'from deserializer',
      `com_med_improve` string COMMENT 'from deserializer',
      `com_med_dimension` string COMMENT 'from deserializer',
      `clean_quiet_achieve` string COMMENT 'from deserializer',
      `clean_quiet_improve` string COMMENT 'from deserializer',
      `clean_quiet_dimension` string COMMENT 'from deserializer',
      `discharge_achieve` string COMMENT 'from deserializer',
      `discharge_improve` string COMMENT 'from deserializer',
      `discharge_dimension` string COMMENT 'from deserializer',
      `overall_achieve` string COMMENT 'from deserializer',
      `overall_improve` string COMMENT 'from deserializer',
      `overall_dimension` string COMMENT 'from deserializer',
      `hcahps_base_score` string COMMENT 'from deserializer',
      `hcahps_consistency_score` string COMMENT 'from deserializer')
    ROW FORMAT SERDE
      'org.apache.hadoop.hive.serde2.OpenCSVSerde'
    STORED AS INPUTFORMAT
      'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT
      'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
    LOCATION
      '/user/w205/hospital_compare/hvbp_hcahps_05_28_2015';
