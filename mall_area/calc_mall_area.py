#!/home/leisen/anaconda3/bin/python3
# -*- coding: UTF-8 -*-

# ********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-11-20 12:28
# * Last modified : 2018-11-20 12:28
# * Filename      : calc_mall_area.py
# * Description   : 
# *********************************************************



# =============================================================================
# ##### Configuration #####
# =============================================================================
import time

import pickle
import pandas as pd
from sqlalchemy import create_engine

import getpass as gp


# =============================================================================
# 
# =============================================================================
def tick_start (contex):
    """
    """
    global t0
    t0 = time.time()
    print('\n')
    print(contex, '...')

def tick_end (contex=''):
    """
    """
    global t1
    global t_range
    t1 = time.time()
    t_range = round(t1 - t0, 4)
    print('...', contex, 'excution complete. (Time consumed:', t_range,'s)')



## Data base configuration 
host_adress = input("Please input the host adress: ")
port_adress = input("Please input the port adress: ")
db_name = input("Please input DB name: ")


username = input("Please input your user name on DB: ")
passcode = gp.getpass("Please input your passcode: ")


def pgconn():
    address = 'postgresql://' + username + ':' + passcode + '@' + host_adress + ':' + port_adress + '/' + db_name
    conn = create_engine(address, echo=False).connect()
    return conn



# =============================================================================
# ##### Begin of file #####
# =============================================================================
t00 = time.time()
print('======================================================================')
print('This file is now beeing processed ...')
print('======================================================================')


conn = pgconn()

# =============================================================================
# ##### Read data set #####
# =============================================================================
tick_start('Excuting SQL code')

##
sql_code = """
SELECT "mall_name", 
"floor", 
COUNT(*), 
ST_Area(ST_ConcaveHull(ST_Union(location), 0.8)::geography) AS "area_concave", 
ST_Area(ST_ConvexHull(ST_Union(location))::geography) AS "area_convex"
FROM gis.mall_shopping_data
GROUP BY "mall_name", "floor"
ORDER BY "mall_name", "floor"
;
"""
df_mall_area = pd.read_sql(sql=sql_code, con=conn, columns=None)

tick_end()

# =============================================================================
# ##### Upload data set #####
# =============================================================================
data = df_mall_area.copy()

pg_schema_name = 'gis'
pg_table_name = 'mall_area'

tick_start('Uploading data sets' + pg_schema_name + '.' + pg_table_name)

data.to_sql(schema=pg_schema_name, name=pg_table_name, con=conn, 
        if_exists='replace', index=False, chunksize=10000)

tick_end()



# =============================================================================
# ##### Read data set #####
# =============================================================================
tick_start('Excuting SQL code')

##
sql_code = """
SELECT "mall_name", 
SUM(ROUND("area_concave")) AS "area_sum", 
MIN(ROUND("area_concave")) AS "area_min", 
MAX(ROUND("area_concave")) AS "area_max", 
ROUND(AVG("area_concave")) AS "area_avg", 
SUM("count") AS "shop_count", 
COUNT(*) AS "floor_count", 
SUM(ROUND("area_concave"))*COUNT(*)  AS "area_max_sum"
FROM gis.mall_area 
GROUP BY "mall_name" 
ORDER BY "mall_name" 
;
"""

df_mall_area_sum = pd.read_sql(sql=sql_code, con=conn, columns=None)

tick_end()


# =============================================================================
# ##### Upload data set #####
# =============================================================================
data = df_mall_area_sum.copy()

pg_schema_name = 'gis'
pg_table_name = 'mall_area_sum'

tick_start('Uploading data sets' + pg_schema_name + '.' + pg_table_name)

data.to_sql(schema=pg_schema_name, name=pg_table_name, con=conn, 
        if_exists='replace', index=False, chunksize=10000)

tick_end()



# =============================================================================
# ##### End of file #####
# =============================================================================
t11 = round(time.time() - t00, 4)
print('\n')
print('======================================================================')
print('This file has been successfully excuted! (Total time:', t11, 's)')
print('======================================================================')
