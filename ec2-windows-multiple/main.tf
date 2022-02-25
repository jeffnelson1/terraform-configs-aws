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
  subnet_id = "enter subnet id"
  count     = length(var.vm_names)
  tags = {
    Name = "nic-${var.vm_names[count.index]}"
  }
}

resource "aws_instance" "instance_1" {
  ami           = "ami-07817f5d0e3866d32"
  instance_type = "t2.micro"
  key_name      = "enter keypair name"
  count         = length(var.vm_names)
  network_interface {
    network_interface_id = element(aws_network_interface.nic_1.*.id, count.index)
    device_index         = 0
  }

  tags = {
    Name = var.vm_names[count.index]
  }
}