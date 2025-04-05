# AWS VPC Architecture

This project demonstrates how to create a highly available AWS infrastructure using AWS CLI and Terraform. The setup includes:
- **VPC** with Public and Private Subnets
- **EC2 Instances** in the Public and Private Subnets
- **ALB** (Application Load Balancer)
- **Auto Scaling Group** for high availability
- **NAT Gateway** for internet access from private subnets

## Prerequisites

- AWS CLI installed and configured
- Terraform (if using Terraform for provisioning)
- EC2 Key Pair for SSH access

## Setup

### Step 1: Set up VPC and Subnets
1. Navigate to the `setup/vpc-setup.sh` file to create your VPC and configure subnets.

### Step 2: EC2 Instance Setup
1. Launch EC2 instances in both public and private subnets using `setup/ec2-setup.sh`.

### Step 3: ALB and Auto Scaling Setup
1. Configure your Application Load Balancer and Auto Scaling Group using `setup/alb-setup.sh` and `setup/autoscaling-setup.sh`.

### Step 4: Run Server Application
1. On your EC2 instances, the Python server will run and respond with the private EC2 instance from which the request is coming.

### Step 5: Access the ALB DNS
1. Use the ALB DNS URL to access the application running on the EC2 instances.

## Tear Down

After the hands-on practice, tear down all AWS resources to avoid unnecessary costs. Follow  tear donw script.

### Architecture Diagram
![Architecture Diagram](aws-vpc-architecture/docs/vpc-example-private-subnets.png)
