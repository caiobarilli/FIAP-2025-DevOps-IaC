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

module "ec2_instance" {
  source = "./modules/ec2"

  ami           = "ami-0de716d6197524dd9" # Substitua pela AMI da sua região
  instance_type = "t2.micro"
  security_groups = ["allow_ssh_http"]
  #security_groups = [aws_security_group.allow_ssh_http.name]
  name          = "Terraform Module Example"
}

output "instance_public_ip" {
  value = module.ec2_instance.public_ip
}