#!/bin/bash
# Create ALB and attach EC2 instances to it

# Create Application Load Balancer
aws elbv2 create-load-balancer --name my-alb --subnets <public-subnet-id> --security-groups <sg-id> --scheme internet-facing

# Create Target Group and register EC2 instances
aws elbv2 create-target-group --name my-target-group --protocol HTTP --port 80 --vpc-id <vpc-id>

# Register EC2 instances with target group
aws elbv2 register-targets --target-group-arn <target-group-arn> --targets Id=<instance-id-1> Id=<instance-id-2>

