
  resource "aws_s3_bucket" "example" {
  bucket = "bit-bucket3"

  tags = {
    Name        = "teste-terraform"
  }
}


resource "aws_instance" "ec2" {
  ami           = "ami-0c0746ac7168488ae"
  instance_type = "t3.micro"
  subnet_id     = data.terraform-subnet-01
  key_name      = "jenkins"
  tags = {
    Name = "terraform-debian-01"
  }
  vpc_security_group_ids = [ "${aws_security_group.terraform-sg.id}" ]
  depends_on = [
    aws_security_group.terraform-sg
  ]
}

