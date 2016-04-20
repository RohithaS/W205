from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        #self.redis = StrictRedis()
        cur.execute("DROP TABLE IF EXISTS tweetwordcount;")
        cur.execute('''CREATE TABLE tweetwordcount
                    (word TEXT PRIMARY KEY NOT NULL, count INT NOT NULL);''')
        conn.commit()


    def process(self, tup):
        word = tup.values[0]
        #self.log('%s: %d' % (word, self.counts[word]))
        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.
        self.counts[word] += 1
        self.emit([word, self.counts[word]])
        #self.log('%s: %d' % (word, self.counts[word]))
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432") 
        cur = conn.cursor()
        # Create new entry if word is first of its kind
        x=1
        if self.counts[word]==1:
            cur.execute('INSERT INTO tweetwordcount(word,count) VALUES (%s, %s)',(word,self.counts[word]))
            #query = "INSERT INTO tweetwordcount (word,count) VALUES ('" + word + "',1);"
            #self.log("Query: " + query) 
            #cur.execute(query)
        else:
            cur.execute('UPDATE tweetwordcount SET count=%s WHERE word=%s', (self.counts[word], word))
            #uCount = self.counts[word]
            #query = "UPDATE tweetwordcount SET count=" + str(uCount) + " WHERE word='" + word + "';"		
            #cur.execute(query)

        conn.commit()

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
