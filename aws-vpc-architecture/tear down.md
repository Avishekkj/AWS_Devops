#  AWS RESOURCE TEARDOWN SCRIPT 

# 1. Terminate EC2 Instances (if not already handled by Auto Scaling)
aws ec2 terminate-instances --instance-ids i-xxxxxxxxxxxxxxxxx

## 2. Delete Auto Scaling Group
aws autoscaling delete-auto-scaling-group --auto-scaling-group-name my-asg --force-delete

## 3. Delete Launch Template
aws ec2 delete-launch-template --launch-template-name my-launch-template

## 4. Delete Target Group
aws elbv2 delete-target-group --target-group-arn <target-group-arn>

## 5. Delete Load Balancer
aws elbv2 delete-load-balancer --load-balancer-arn <alb-arn>

## 6. Delete Listeners (before ALB if needed)
aws elbv2 delete-listener --listener-arn <listener-arn>

## 7. Delete NAT Gateway
aws ec2 delete-nat-gateway --nat-gateway-id $NAT_GATEWAY_ID

## 8. Release Elastic IP
aws ec2 release-address --allocation-id $EIP_ID

## 9. Disassociate and delete Route Tables
aws ec2 disassociate-route-table --association-id rtbassoc-xxxxxxxxxxxxxxxxx
aws ec2 delete-route-table --route-table-id $PUBLIC_RT_ID
aws ec2 delete-route-table --route-table-id $PRIVATE_RT_ID

## 10. Delete Subnets
aws ec2 delete-subnet --subnet-id $PUBLIC_SUBNET_1_ID
aws ec2 delete-subnet --subnet-id $PUBLIC_SUBNET_2_ID
aws ec2 delete-subnet --subnet-id $PRIVATE_SUBNET_1_ID
aws ec2 delete-subnet --subnet-id $PRIVATE_SUBNET_2_ID

## 11. Detach and delete Internet Gateway
aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID

## 12. Delete Security Group
aws ec2 delete-security-group --group-id $SECURITY_GROUP_ID

## 13. Delete VPC
aws ec2 delete-vpc --vpc-id $VPC_ID





