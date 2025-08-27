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
  ami           = "ami-0de716d6197524dd9" # Substitua pela AMI da sua região
  instance_type = "t2.micro"
  key_name      = "labsuser" # Substitua pelo nome da sua chave SSH

  tags = {
    Name = "Remote Exec Example"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu" # Substitua pelo usuário da sua AMI
    private_key = file("C:\\Workspace\\terraform_ex11_remoteexec\\labsuser.pem") # Substitua pelo caminho da sua chave SSH
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}