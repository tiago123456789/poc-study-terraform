terraform {
  backend "s3" {
    bucket = "poc-terraform-backend-state"
    profile = "tiago"
    region = "us-east-1"
    key = "cloudwatch"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "tiago"
}

resource "aws_cloudwatch_log_group" "log" {
  name              = "/application/${var.log_name}"
  retention_in_days = 30 
}

resource "aws_cloudwatch_log_stream" "stream" {
  name           = "${var.log_name}-log-stream"
  log_group_name = aws_cloudwatch_log_group.log.name
}




