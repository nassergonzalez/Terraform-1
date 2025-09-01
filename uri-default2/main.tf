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
  region  = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "main"
  }
}

resource "aws_instance" "ec2-be" {
  instance_type = "t2.micro"
  ami           = "ami-830c94e3"
#   subnet_id = aws_subnet.main.id
  tags = {
    name = "ec2-be"
  }
}



