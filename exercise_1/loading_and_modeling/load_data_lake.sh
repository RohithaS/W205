#loading files from laptop to AMI
hdfs dfs -mkdir /user/w205/exercise_1

wget https://s3.amazonaws.com/ucbdatasciencew205/lab_datasets/

#removing header and renaming files
mkdir hospital_files
cd hospital_files
tail -n +2 Hospital General Information.csv > hospitals.csv
tail -n +2 Timely and Effective Care.csv > effective_care.csv
tail -n +2 Readmissions and Deaths.csv > readmissions.csv
tail -n +2 Measure Dates.csv > Measures.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > survey_results.csv

#loading files from AMI to HDFS
sudo -u hdfs dfs -put ~/w205/exercise_1/hospital_files/* hdfs:/data/w205/hospital_files
