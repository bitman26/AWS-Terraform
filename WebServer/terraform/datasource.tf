data "aws_s3_bucket" "tfstate-bucket" {
  bucket = "bit-tfstate-bucket"
}

data "aws_subnet" "terraform-subnet-01" {
  id = terraform-subnet-01
}

data "aws_security_group" "terraform-sg" {
  id =  terraform-sg
}
