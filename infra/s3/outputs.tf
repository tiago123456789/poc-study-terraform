
output "bucket_name" {
  description = "Bucket name on s3"
  value = "${var.bucket_name}-${var.environment}" 
}
