resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.vpc-range

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "terraform-subnet-01" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.vpc-range

  tags = {
    Name = "terraform-subnet-01"
  }
}

resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform_igw"
  }
}

resource "aws_route_table" "terraform-rb" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = var.default-route
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
}

resource "aws_eip" "eip_terraform-ec2" {
  instance = aws_instance.ec2.id
  domain   = "vpc"
}
