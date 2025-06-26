# Configure the AWS Provider (Terraform 0.12 syntax)
provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"  # Last compatible version for TF 0.12
}

# Create an SQS queue
resource "aws_sqs_queue" "my_queue" {
  name                      = "my-queue"
  delay_seconds             = 90           # Default 0 (seconds)
  max_message_size          = 262144       # 256KB (default)
  message_retention_seconds = 345600       # 4 days (default)
  receive_wait_time_seconds = 10           # Long polling (default 0)
  visibility_timeout_seconds = 30          # Default 30

  # Optional tags
  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}

# Output the queue URL
output "sqs_queue_url" {
  value = aws_sqs_queue.my_queue.id
}

# Output the queue ARN
output "sqs_queue_arn" {
  value = aws_sqs_queue.my_queue.arn
}
