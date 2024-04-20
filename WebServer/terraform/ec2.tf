
  resource "aws_s3_bucket" "example" {
  bucket = "bit-bucket3"

  tags = {
    Name        = "teste-terraform"
  }
}


resource "aws_instance" "ec2" {
  ami           = "ami-0c0746ac7168488ae"
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.terraform-subnet.id
  key_name      = "jenkins"
  tags = {
    Name = "terraform-debian-01"
  }
  vpc_security_group_ids = [ "${data.aws_security_group.sg-terraform.id}" ]
  #depends_on = [
   # aws_security_group.terraform-sg
  #]
}

resource "aws_eip_association" "associacao_eip" {
  instance_id   = aws_instance.ec2.id
  allocation_id = data.aws_eip.eip_terraform-ec2.id
}
