resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = var.security_groups

  tags = {
    Name = var.name
  }
}