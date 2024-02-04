
variable "queue_name" {
  type = string
  default = "terraform-example-queue"
}

variable "aws_profile" {
  type = string
  default = "default"
}

variable "environment" {
  description = "The environment for the infrastructure"
  type        = string
  default = "dev"
}