
##Load Datafiles from laptop to AMI
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses


wget -O "Hospital_Revised_Flatfiles.zip" https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip


unzip Hospital_Revised_Flatfiles.zip -d data_file

# Remove header and rename data files (eliiminating spaces)
tail -n+2 data_file/"Hospital General Information.csv" > data_file/"hospitals.csv"
tail -n+2 data_file/"Timely and Effective Care - Hospital.csv" > data_file/"effective_care.csv"
tail -n+2 data_file/"Readmissions and Deaths - Hospital.csv" > data_file/"readmissions.csv"
tail -n+2 data_file/"Measure Dates.csv" >data_file/"Measures.csv"
tail -n+2 data_file/"hvbp_hcahps_05_28_2015.csv" > data_file/"surveys_responses.csv"



hdfs dfs -put data_file/"hospital.csv" /user/w205/hospital_compare/hospitals
hdfs dfs -put data_file/"effective_care.csv" /user/w205/hospital_compare/effective_care
hdfs dfs -put data_file/"readmissions.csv" /user/w205/hospital_compare/readmissions
hdfs dfs -put data_file/"measures.csv" /user/w205/hospital_compare/Measures
hdfs dfs -put data_file/"surveys_response.csv" /user/w205/hospital_compare/surveys_responses
