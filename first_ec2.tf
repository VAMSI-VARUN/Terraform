terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.0"
    }
  }
}

provider "aws" {

  # Configuration options
}

resource "aws_instance" "My_first_IAC_server" {
  ami = "ami-08982f1c5bf93d976"
  instance_type = "t2.micro"

  tags = {
    Name = "My First EC2 Server"
    Project = "Terraform-Learning"
    Owner = "Vamsi"
  }
}



