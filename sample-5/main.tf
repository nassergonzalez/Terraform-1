provider "aws" {
  region  = "us-west-2"
  version = "~> 3.0"  # This is the correct syntax for Terraform 0.12
}


data "aws_ami" "app_server" {
  filter {
    name = "image-id"
    values = ["ami-830c94e3"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = var.type
  tags = {
    Name = "ExampleAppServerInstance-Uri"
  }
  
  lifecycle {
    # The AMI ID must refer to an AMI that contains an operating system
    # for the `x86_64` architecture.
    precondition {
      condition     = data.aws_ami.app_server.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
  }
}
