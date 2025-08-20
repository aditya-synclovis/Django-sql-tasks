'''
Utility funtion rows and cloumns to dict
'''

def columns_to_dict(rows,columns,logger):
    try:
        results = []
        for row in rows:
            row_dict = {}
            for i, value in enumerate(row):
                # Handle different data types
                if hasattr(value, 'isoformat'):  # datetime objects
                    row_dict[columns[i]] = value.isoformat()
                else:
                    row_dict[columns[i]] = value
            results.append(row_dict)
        return results
    except Exception as e:
        logger.error(f"Database error: {str(e)}")
        raise e
