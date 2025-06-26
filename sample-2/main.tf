provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"  # This is the correct syntax for Terraform 0.12
}

# data "aws_ami" "app_server" {
#   filter {
#     name = "image-id"
#     values = ["ami-830c94e3"]
#   }

#   owners = ["099720109477"] # Canonical
# }

resource "aws_instance" "my_ec2" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.small"
#   subnet_id = "subnet-0d4be14d5f95eec6d"
  tags = {
    Name = "ExampleAppServerInstance-Uri-7"
  }
  
#   lifecycle {
#     # The AMI ID must refer to an AMI that contains an operating system
#     # for the `x86_64` architecture.
#     precondition {
#       condition     = data.aws_ami.app_server.architecture == "x86_64"
#       error_message = "The selected AMI must be for the x86_64 architecture."
#     }
#   }
}
