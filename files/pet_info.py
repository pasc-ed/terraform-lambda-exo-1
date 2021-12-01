import boto3

def pet_info(event, context):
    # Connected to the S3 service through API calls
    s3_client = boto3.client('s3')

    # RETRIEVE all existing buckets in my account
    my_buckets_raw = s3_client.list_buckets()

    # List the name of each bucket
    for b in my_buckets_raw["Buckets"]:
        print(" Name of bucket : " + b["Name"])