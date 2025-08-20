# ec2-vpc
# Terraform (IAC) Creating EC2 with VPC setup
Steps for implementation: 

1. Deploy a VPC and a subnet 
2. Deploy an internet gateway and associate it with a the VPC
3. Setup a route table with a route to the IGW and assocaite with a subnet
4. Deploy an EC2 instance inside of the created subnet and associate a public IP 
5. Associate a security group that allows public ingress
6. Change the EC2 instance to use a publicity available NGINX AMI
7. Destory everything

