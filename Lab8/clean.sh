#!/bin/bash
FUNC_NAME=$(aws lambda list-functions --query 'Functions[0].FunctionName' --output text)

echo $FUNC_NAME

#aws lambda delete-function --function-name $FUNC_NAME
aws iam delete-policy --policy-arn arn:aws:iam::701577966315:policy/AWSLambdaS3Policy
aws iam delete-role --role-name lambda-s3-role

aws s3 rm s3://dmitrog --recursive

aws s3 rb s3://dmitrog
