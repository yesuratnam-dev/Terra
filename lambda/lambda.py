def hello_lambda(event, context):
    return {
        'statusCode': 200,
        'body': "Hello World!"
        }

print(hello_lambda("a","b")['statusCode'])

if __name__ == "__main__":
    hello_lambda("a","b")