'''
Utility funtion fetching query
'''

from django.db import connection

def fetch_query(query,logger):
    try:
        with connection.cursor() as cursor:
            cursor.execute(query)
            rows = cursor.fetchall()
            if len(rows)!=0:
                columns = [col[0] for col in cursor.description]
                return rows,columns
            else:
                return [],[]
    except Exception as e:
        logger.error(f"Database error: {str(e)}")
        raise e