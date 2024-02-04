terraform {
  backend "s3" {
    bucket = "poc-terraform-backend-state"
    region = "us-east-1"
    key = "s3"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "${var.aws_profile}"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}-${var.environment}" 
}





