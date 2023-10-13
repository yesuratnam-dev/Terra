def hello_lambda(event, context):
    return {
        'statusCode': 200,
        'body': "Hello World!"
        }
