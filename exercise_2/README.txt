#Step-by-Step Setup Instructions (Run all instructions as root where applicable)

1) Create instance with 30GB root using UCB W205 Spring Ex 2 Image
   Attach volume of 100GB to the running instance 
   Open the Ports: 4040, 50070, 8080, 22, 10000, 8020, 8088, 5432
2) Follow Appendix instructions to install Python 2.7 (Bottom of page 10)
3) Follow Appendix instructions to install Streamparse (Page 9)
4) Run pip install psycopg2
5) Run pip install tweepy
6) Run wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
7) Check whether Postgres is running
ps auxwww | grep postgres
8) If not, change path to /data and start Postgres: /data/start_postgres.sh
9) Clone my git repository:
	git clone https://github.com/RohithaS/exercise_2.git
10) Create Postgres database “tcount”
	Run the following commands to create tcount database:
		psql -U postgres
		CREATE DATABASE tcount;
		\q
11) Copy files from github / remove existing files 
rm /root/streamparse/tweetwordcount/topologies/wordcount.clj
rm /root/streamparse/tweetwordcount/src/spouts/words.py
rm /root/streamparse/tweetwordcount/src/bolts/wordcount.py

cp  /root/W205/exercise_2/extweetwordcount/topologies/extweetwordcount.clj /root/streamparse/extweetwordcount/topologies
cp  /root/W205/exercise_2/extweetwordcount/src/spouts/tweets.py  /root/streamparse/extweetwordcount/src/spouts
cp  /root/W205/exercise_2/extweetwordcount/src/bolts/parse.py  /root/streamparse/extweetwordcount/src/bolts
cp  /root/W205/exercise_2/extweetwordcount/src/bolts/wordcount.py  /root/streamparse/extweetwordcount/src/bolts
cp  /root/W205/exercise_2/extweetwordcount/TwitterCredentials.py  /root/streamparse/extweetwordcount/
cp  /root/W205/exercise_2/hello-stream-twitter.py  /root/streamparse/extweetwordcount/
cp  /root/W205/exercise_2/psycopg-sample.py  /root/streamparse/extweetwordcount/
cp  /root/W205/exercise_2/extweetwordcount/finalresults.py  /root/streamparse/extweetwordcount/
cp  /root/W205/exercise_2/extweetwordcount/histogram.py  /root/streamparse/extweetwordcount/



12 Run stream:
	cd into exercise_2 repo
	cd into extweetwordcount folder, and run “sparse run”
        ------------------------
        $ cd extweetwordcount
        $ sparse run

	Keep it running for as long as you’d like to build up the table
13)Run either of the python files, with option argument for finalresults.py:
	histogram.py
	finalresults.py
14)To create the Plot.png, import matplotlib and numpy by running the following commands, in the extweetwordcount directory:
	pip install numpy
	pip install matplotlib
	python top20plot.py


