data "aws_s3_bucket" "tfstate-bucket" {
  bucket = "bit-tfstate-bucket"
}

data "aws_subnet" "terraform-subnet-01" {
  id = subnet-0fb09d2ad33a55722
}

data "aws_security_group" "terraform-sg" {
  id =  sg-0ada3cda303538744
}
