terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.0"
    }
  }
  backend "s3" {
    bucket = "bit-tfstate-bucket"
    key    = "aws-project/terraform-tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
    region = "sa-east-1"

 }

