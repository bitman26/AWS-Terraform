terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.0"
    }
  }
}

provider "aws" {
    region = "sa-east-1"

  }

  resource "aws_s3_bucket" "example" {
  bucket = "jenkins-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
