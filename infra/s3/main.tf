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

  website {
    index_document = "index.html"    
    error_document = "error.html"    
  }
}


resource "aws_s3_bucket_public_access_block" "static_site_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "static_site_bucket" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "static_site_bucket" {
  depends_on = [
	aws_s3_bucket_public_access_block.static_site_bucket,
	aws_s3_bucket_ownership_controls.static_site_bucket,
  ]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "public-read"
}




