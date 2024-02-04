
variable "log_name" {
  type = string
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