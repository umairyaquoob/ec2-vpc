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

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "ec2-vpc"
    ManagedBy = "Terraform"
    Project   = "ec2-vpc"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/10"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "ec2-vpc"
    ManagedBy = "Terraform"
    Project   = "ec2-vpc"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


