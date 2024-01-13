
  resource "aws_s3_bucket" "example" {
  bucket = "bit-bucket3"

  tags = {
    Name        = "teste-terraform"
  }
}

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


resource "aws_instance" "ec2" {
  ami           = "ami-0c0746ac7168488ae"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.terraform-subnet-01.id

  tags = {
    Name = "terraform-debian-01"
  }
}
