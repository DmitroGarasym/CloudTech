#!/bin/bash

aws s3api create-bucket --bucket cloudlab1 --region us-east-1                              

aws s3api put-bucket-policy --bucket cloudlab1 --policy file://policy_s3.json         

aws s3 sync ./ s3://cloudlab1/                                                             

aws s3 website s3://cloudlab1/ --index-document index.html --error-document error.html

#website url: http://cloudlab1.s3-website-us-east-1.amazonaws.com/