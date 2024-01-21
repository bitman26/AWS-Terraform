data "terraform_remote_state" "tfstate-bucket" {
  backend = "s3"
  config = {
    bucket = "bit-tfstate-bucket"
    key    = "aws-projects/terraform.tfstate"
    region = "sa-east-1"
  }
}