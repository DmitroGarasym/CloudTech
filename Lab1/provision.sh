#!/bin/bash

aws s3api create-bucket --bucket dmytrolab1 --region us-east-1                              

aws s3api put-bucket-policy --bucket dmytrolab1 --policy file://policy_s3.json         

aws s3 sync ./ s3://dmytrolab1/                                                             

aws s3 website s3://dmytrolab1/ --index-document index.html --error-document error.html

#website url: http://dmytrolab1.s3-website-us-east-1.amazonaws.com/
