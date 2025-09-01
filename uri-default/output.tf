
output "instance_type" {
    description = "VM Instance type"
    value = aws_instance.ec2test1.instance_type
}

output "ip" {
    description = "VM private IP"
    value = aws_instance.ec2test1.private_ip
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "bucket_domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket_website_configuration.s3_bucket.website_domain
}
