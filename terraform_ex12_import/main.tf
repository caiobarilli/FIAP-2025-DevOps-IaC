terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Substitua pela sua região
}

resource "aws_instance" "example" {
  ami           = "ami-00ca32bbc84273381"  # Substitua pela AMI da sua região
  instance_type = "t3.micro"

  tags = {
    Name = "Instance"
  }
}