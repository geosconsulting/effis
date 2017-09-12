import psycopg2
import pandas as pd
import sqlalchemy 


try:
    conn = psycopg2.connect("dbname='effis' user='postgres' host='localhost' password='antarone'")
    print "Connected to the database"
except:
    print "I am unable to connect to the database"
    
cur = conn.cursor()

cur.execute("""SELECT * FROM public.hotspots WHERE country = 'ES'""")

rows = cur.fetchall()

print "\nPrint the rows by row:\n"
for row in rows:
    print row 

# def connect(user, password, db, host='localhost', port=5432):
#     
#     '''Returns a connection and a metadata object'''
#     # We connect with the help of the PostgreSQL URL
#     url = 'postgresql://{}:{}@{}:{}/{}'    
#     url = url.format(user, password, host, port, db)
#     
# 
#     # The return value of create_engine() is our connection object
#     con = sqlalchemy.create_engine(url, client_encoding='utf8')
# 
#     # We then bind the connection to MetaData()
#     meta = sqlalchemy.MetaData(bind=con, reflect=True)
# 
#     return con, meta
# 
# con, meta = connect('postgres', 'antarone', 'effis')
# 
# print con
#    
# hotspots_df = pd.read_table('hostspots',con)