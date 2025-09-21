terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform_firewall"
  description = "Managed from Terraform"
  

  tags = {
    Name = "terraform_firewall"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_rule-1" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
  
}

resource "aws_vpc_security_group_egress_rule" "outnound_rule_1" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
  
}