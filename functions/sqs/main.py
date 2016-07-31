import os
import boto3
import time
import pprint
pp = pprint.PrettyPrinter()


def handle(event, context):
    client = boto3.client("sqs")
    while True:
        message_body = str(time.time())
        client.send_message(
                QueueUrl=os.environ["QueueUrl"],
                MessageBody=message_body
                )
        pp.pprint(message_body)
        time.sleep(1)
