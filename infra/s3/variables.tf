
variable "bucket_name" {
  type = string
  default = "tiago-personal-website"
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