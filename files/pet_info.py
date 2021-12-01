import boto3

def pet_info(event, context):
    # Connected to the S3 service through API calls
    s3_client = boto3.client('s3')

    # Collect the bucket name from Event
    target_bucket_name = event["S3Bucket"]

    # RETRIEVE all existing buckets in my account
    my_buckets_raw = s3_client.list_buckets()

    # List the name of each bucket
    for b in my_buckets_raw["Buckets"]:
        print("Name of bucket : " + b["Name"])

    # Check if the target bucket exists
    for b in my_buckets_raw["Buckets"]:
        if b["Name"] == target_bucket_name:
            print("The bucket " + target_bucket_name + " exists!")