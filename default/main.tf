terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ec2test2" {
  instance_type = var.instance_type
  ami           = "ami-0aa7d40eeae50c9a9"
#   subnet_id = aws_subnet.main.id
  tags = {
    name = "ec2test2"
    extra= var.extra
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# resource "aws_s3_bucket_acl" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id

#   acl = "public-read"
# }

# resource "aws_s3_bucket_policy" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject"
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource = [
#           aws_s3_bucket.s3_bucket.arn,
#           "${aws_s3_bucket.s3_bucket.arn}/*",
#         ]
#       },
#     ]
#   })
# }


