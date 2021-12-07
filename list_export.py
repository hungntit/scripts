import boto3

client = boto3.client('cloudformation')
response = client.list_exports()
for export in response['Exports']:
    print("{}='{}'".format(export['Name'].replace('-','_'), export['Value']))
