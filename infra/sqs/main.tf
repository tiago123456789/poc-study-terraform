terraform {
  backend "s3" {
    bucket = "poc-terraform-backend-state"
    region = "us-east-1"
    key = "sqs"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "${var.aws_profile}"
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.queue_name
  delay_seconds             = 0
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

