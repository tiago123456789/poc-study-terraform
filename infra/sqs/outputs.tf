
output "terraform_queue_url" {
  description = "Queue url of queue created"
  value       = "${aws_sqs_queue.terraform_queue.url}"
}

output "terraform_queue_arn" {
  description = "Queue arn of queue created"
  value       = "${aws_sqs_queue.terraform_queue.arn}"
}
