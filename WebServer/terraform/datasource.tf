data "aws_s3_bucket" "tfstate-bucket" {
  bucket = "bit-tfstate-bucket"
}

data "aws_subnet" "terraform-subnet" {
 filter {
    name = "tag:Name"
    values = ["terraform-subnet-01"]
  }  
}

data "aws_security_group" "sg-terraform" {
 filter {
    name = "tag:Name"
    values = ["terraform-sg"]
  }  
}

data "aws_eip" "eip_terraform-ec2" {
  filter {
    name   = "tag:Name"
    values = ["eip_terraform"]
  }
}
