#!/bin/bash
aws s3api create-bucket --bucket dmitrog --region us-east-1

aws s3api put-object --bucket dmitrog --key logo.png --body logo.png

# policy to retrieve logo from bucket
aws iam create-policy --policy-name AWSLambdaS3Policy --policy-document file://s3_policy.json

# role with permission for a lambda function (to use role policy)
aws iam create-role --role-name lambda-s3-role --assume-role-policy-document file://trust-policy.json

FUNC_NAME=$(aws lambda list-functions \
            --query 'Functions[0].FunctionName' \
            --output text)

echo $FUNC_NAME

# update lambda config
aws lambda update-function-configuration --function-name $FUNC_NAME --timeout 90
