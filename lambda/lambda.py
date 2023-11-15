import boto3
import pandas as pd

def hello_lambda(event, context):

    df = pd.read_csv("s3://kuyesura-acer-s3/flights.csv")

    output = df.head()

    output.to_csv("s3://kuyesura-acer-s3/output.csv", index=False)


if __name__ == "__main__":
    hello_lambda("a","b")