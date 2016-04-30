#format disk
fdisk -l

# make the directory at the top level called /data
ls /

# set /data as readable, writable and executable by all users
chmod a+rwx /data

# download the setup script
wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
chmod +x ./setup_ucb_complete_plus_postgres.sh

#run the setup script
./setup_ucb_complete_plus_postgres.sh /dev/xvdf

# This should setup HDFS, Hive and PostgreSQL

# Start postgres
/data/start_postgres.sh

#change to w205 user
su - w205

#make a folder for the project
hdfs dfs -mkdir /user/w205/project1

# make a folder in HDFS for each dataset and place them in HDFS
hdfs dfs -mkdir /user/w205/project1/decemberdata
hdfs dfs -put /data/December_2013.csv /user/w205/project1/decemberdata

hdfs dfs -mkdir /user/w205/project1/airports
hdfs dfs -put /data/airports.csv /user/w205/project1/airports

hdfs dfs -mkdir /user/w205/project1/routes
hdfs dfs -put /data/routes.csv /user/w205/project1/routes
