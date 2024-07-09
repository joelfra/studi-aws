resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = "my-app-vpc"
  }
}

# Creating 1st private subnet 
resource "aws_subnet" "subnet_3a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24" #32 IPs
  availability_zone       = "eu-west-3a"
}
# Creating 2nd private subnet 
resource "aws_subnet" "subnet_3b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.32.0/24" #32 IPs
  availability_zone       = "eu-west-3b"
}
# Creating 1st public subnet 
resource "aws_subnet" "subnet_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/24" #32 IPs
  availability_zone       = "eu-west-3a"
}

# Creating 2st public subnet 
resource "aws_subnet" "subnet_3d" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/24" #32 IPs
  availability_zone       = "eu-west-3b"
}