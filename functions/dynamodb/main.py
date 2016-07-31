import os
import boto3
import pprint
pp = pprint.PrettyPrinter()


def handle(event, context):
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table(os.environ["TableName"])
    sqs = boto3.client("sqs")
    try:
        message = sqs.receive_message(
                QueueUrl=os.environ["QueueUrl"]
                )["Messages"][0]
        pp.pprint(message)
        pp.pprint(table.put_item(
            Item={"Id": message["Body"]}
            ))
    except Exception as e:
        pp.pprint(e)
    else:
        pp.pprint(sqs.delete_message(
            QueueUrl=os.environ["QueueUrl"],
            ReceiptHandle=message["ReceiptHandle"]
            ))
