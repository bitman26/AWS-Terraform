data "aws_s3_bucket" "tfstate-bucket" {
  bucket = "bit-tfstate-bucket"
}

data "aws_subnet" "terraform-subnet-01" {
  id       = terraform-subnet-01
}
