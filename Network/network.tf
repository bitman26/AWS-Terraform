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

resource "aws_default_route_table" "terraform-rt-default" {
  default_route_table_id = aws_vpc.terraform-vpc.default_route_table_id

  route {
      cidr_block = var.default-route
      gateway_id = aws_internet_gateway.terraform_igw.id
  }
}

resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "terraform-security-group"
  vpc_id      = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "terraform-sg-ingress_rule" {
  security_group_id = aws_security_group.terraform-sg.id
  cidr_ipv4         = var.default-route
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "terraform-sg-egress_rule" {
  security_group_id = aws_security_group.terraform-sg.id
  cidr_ipv4         = var.default-route
  ip_protocol       = "-1" 
}

resource "aws_eip" "eip_terraform-ec2" {
  domain   = "vpc"
  tags = { Name = "eip_terraform" } 
}
