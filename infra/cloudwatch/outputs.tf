
output "log_name" {
  description = "Cloudwatch log name"
  value = "${aws_cloudwatch_log_group.log.name}"
}
