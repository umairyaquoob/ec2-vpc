resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "ec2-vpc"
    ManagedBy = "Terraform"
    Project   = "ec2-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name      = "ec2-vpc-public"
    ManagedBy = "Terraform"
    Project   = "ec2-vpc"
  }
}