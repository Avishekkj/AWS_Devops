i#!/bin/bash
# Set up VPC, Subnets, Route Tables

aws ec2 create-vpc --cidr-block 10.0.0.0/16 --region ap-southeast-2 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=aws-devops-prod-vpc}]'
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=aws-devops-prod-vpc" --query "Vpcs[0].VpcId" --output text)

# Create Public and Private Subnets, Internet Gateway, etc.

