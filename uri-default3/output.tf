output "vpc_arn" {
  description = "VPN ARN"
  value = aws_vpc.main.arn
}

output "vpc_id" {
  description = "VPN id"
  value = aws_vpc.main.id
}

output "subnet_id" {
    description = "Subnet ARN"
    value = aws_subnet.main.id
}

output "instance_type" {
    description = "VM Instance type"
    value = aws_instance.ec2-be.instance_type
}

output "ip" {
    description = "VM private IP"
    value = aws_instance.ec2-be.private_ip
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
