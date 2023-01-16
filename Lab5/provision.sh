# Create SNS topic
TOPIC_ARN=`aws sns create-topic --name my_health_checking --query 'TopicArn' --output text`

# Subscribe SNS topic
SUB_ARN=`aws sns subscribe \
    --topic-arn $TOPIC_ARN \
    --protocol email \
    --notification-endpoint garasymd@gmail.com \
    --query 'SubscriptionArn' --output text`

# Set up a cloudwatch
aws cloudwatch put-metric-alarm \
    --alarm-name my_health_checking \
    --alarm-description "Instance is deleted!" \
    --metric-name HealthyHostCount \
    --namespace AWS/ApplicationELB \
    --statistic Average \
    --period 60 \
    --threshold 2 \
    --comparison-operator LessThanThreshold \
    --dimensions Name=TargetGroup,Value=targetgroup/TargetGroup/440b3eb4f2bf41fb Name=LoadBalancer,Value=app/my-load-balancer/b03ef32afbbf5ef1 \
    --evaluation-periods 1 \
    --alarm-actions $TOPIC_ARN