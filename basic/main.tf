
resource "aws_instance" "apptest" {
  instance_type = "t2.nano"
  ami           = "ami-0aa7d40eeae50c9a9"
}
resource "aws_instance" "apptest2" {
  instance_type = "t2.nano"
  ami           = "ami-0aa7d40eeae50c9a9"
}

output "apptest" {
  value = aws_instance.apptest.id
}
