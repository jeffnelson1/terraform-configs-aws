terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_network_interface" "nic_1" {
  subnet_id   = "Enter subnet ID"
  private_ips = ["172.31.0.20"]

  tags = {
    Name = "nic-testvm01"
  }
}

resource "aws_instance" "instance_1" {
  ami           = "ami-07817f5d0e3866d32"
  instance_type = "t2.micro"
  key_name      = "enter key pair name"

  network_interface {
    network_interface_id = aws_network_interface.nic_1.id
    device_index         = 0
  }

  tags = {
    Name = "testvm01"
  }
}